class Transaction < ActiveRecord::Base
  belongs_to :client
  attr_accessible :amount, :type

  before_save :update_total_amount

  def update_total_amount
  	total_amount = self.client.total_amount
  	total_amount.amount += self.amount
  	total_amount.save!
  	
  end
end
