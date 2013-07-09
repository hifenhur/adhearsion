class TotalAmount < ActiveRecord::Base
  belongs_to :client
  attr_accessible :amount, :client_id

  def to_s
  	amount.to_s
  end
end
