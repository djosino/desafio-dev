class TransactionDecorator < ApplicationDecorator
  delegate_all

  def hour
    "#{object.hour.slice(0,2)}:#{object.hour.slice(2,2)}:#{object.hour.slice(4,2)}"
  end
end
