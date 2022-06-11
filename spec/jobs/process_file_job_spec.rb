require 'rails_helper'

RSpec.describe ProcessFileJob, type: :job do
  describe "#perform_later" do
    it 'process file' do
      ActiveJob::Base.queue_adapter = :test

      expect {
        ProcessFileJob.perform_later(document)
      }.to have_enqueued_job
    end
  end
end
