# encoding: utf-8
require 'sound_helper'
class Saldo < Adhearsion::CallController
  include SoundHelper
  attr_accessor :user

  def run
    amount = nil
    2.times do 
      amount = TotalAmount.new(WebService.current_amount(metadata[:user].id)).seconds_amount
    end
    saldo_segundos = amount
    if saldo_segundos > 0
      
      tempo = format_time(saldo_segundos).split(":")
      horas = tempo[0].to_i.to_extenso
      minutos = tempo[1].to_i.to_extenso

      play "beep"
      play "voce-tem"
      

      horas.parameterize.gsub("-", " ").split(" ").each do |numero|
         play numero
      end
      sleep 1
      play "horas"

      play "e"

      minutos.parameterize.gsub("-", " ").split(" ").each do |numero|
         play numero
      end
      play "minutos"

    else
      play 'sem-saldo'
      hangup
    end	    
	
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
