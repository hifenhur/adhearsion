class TotalAmount < ActiveRecord::Base
  self.table_name = "client_amount"
  belongs_to :client, foreign_key: 'id_client'
  




  

  def to_s
    amount.to_s
  end

  def to_time
  	#seconds = (amount*600)/0.9
  	format_time(self.seconds_amount)
  end

  def format_time (timeElapsed)
 
    @timeElapsed = timeElapsed.to_i
 
    #find the seconds
    seconds = @timeElapsed % 60
 
    #find the minutes
    minutes = (@timeElapsed / 60) % 60
 
    #find the hours
    hours = (@timeElapsed/3600)
 
    #format the time
 
    return hours.to_s + ":" + format("%02d",minutes.to_s) + ":" + format("%02d",seconds.to_s)
  end
end
