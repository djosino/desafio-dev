require 'rails_helper'

RSpec.describe ProcessFileJob, type: :job do
  describe "#perform_later" do
    let(:document) { build(:document) }

    it 'process file' do
      ActiveJob::Base.queue_adapter = :test

      expect {
        document.save
      }.to have_enqueued_job
    end
  end

  describe
end
