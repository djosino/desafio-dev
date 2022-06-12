# frozen_string_literal: true

# Process files to Documents
class ProcessFileJob < ApplicationJob
  queue_as :default

  def perform(document)
    document.processing!

    process_file(document)

    document.processed!
  rescue StandardError => e
    document.fail!

    logger.info e
    logger.info 'Invalid File'
  end

  def process_file(document)
    file = File.open(document.file.get_path)

    ApplicationRecord.transaction do
      file.readlines.map(&:chomp).each do |line|
        raise StandardError unless line.size.eql?(80)

        document.transactions.create(line_to_hash(line))
      end
    end
    file.close
  end

  def line_to_hash(line)
    {
      transaction_type_id: line.slice(0, 1),
      date: line.slice(1, 8),
      value: (line.slice(9, 10).to_f / 100),
      document_number: line.slice(19, 11),
      credit_card: line.slice(30, 12),
      hour: line.slice(42, 6),
      owner: line.slice(48, 14),
      store: line.slice(62, 19)
    }
  end
end
