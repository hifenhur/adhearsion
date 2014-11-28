class ParkingValidation < ActiveRecord::Base
  self.table_name = "parking_space_history"
  belongs_to :client
  

  before_create :get_amount_at_instant

  def get_amount_at_instant
    self.amount_at_instant = self.client.current_amount.seconds_amount
  end


  
end
