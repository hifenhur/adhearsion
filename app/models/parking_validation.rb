class ParkingValidation < ActiveRecord::Base
  belongs_to :client
  attr_accessible :vaga, :status, :amount_at_instant

  before_create :get_amount_at_instant

  def get_amount_at_instant
    current_user = self.client
  	self.amount_at_instant = current_user.total_amount.amount
  	
  end

end
