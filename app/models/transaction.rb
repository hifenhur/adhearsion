class Transaction < ActiveRecord::Base
  belongs_to :client
  

  before_save :update_total_amount

  def update_total_amount
  	total_amount = TotalAmount.new do |t|
	  	t.seconds_amount = self.client.current_amount.seconds_amount + to_sec(self.amount)
	  	t.client = self.client
	  	t.datetime = DateTime.now
	  	t.dh_rx = DateTime.now
	  	
	end
  	total_amount.save!
  end

  def to_sec(am)
  	(am*600)/0.9
  end
end

