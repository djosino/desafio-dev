# frozen_string_literal: true

FactoryBot::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end
