# encoding: utf-8
require 'sound_helper'

class Home < Adhearsion::CallController
  include SoundHelper
  attr_accessor :user
  attr_accessor :route

  def run
    tel_number = call[:x_agi_callerid]
    if call[:x_agi_callerid] == "sip-ura"
      call[:x_agi_callerid] = "6282550465"
      tel_number = "6282550465"
    end

    
    begin
      answer
      phone = Phone.new(WebService.phone(tel_number))
      self.user = Client.new(WebService.client(phone.id_client))  
      
    rescue Exception => e
      raise e
    end
    
      
    
    
    #Rotas
    # 1 - Checkin
    # 2 - Checkout
    self.route = ask 'escolher_checkin_ou_checkout', :timeout => 5, :limit => 1
    self.route  = self.route.to_s.to_i
    20.times do 
      logger.debug(self.route)
    end
    
    if self.route == 1
      invoke Saldo, {:user => self.user}
      invoke EscolherVaga, {:user => self.user}
    elsif self.route == 2
      invoke Checkout, {:user => self.user}
    else
      invoke Home
    end

    
    
    

  end

  

  

 
end
