# encoding: utf-8

class Checkout < Adhearsion::CallController
  def run
    outstanding_entries = WebService.checkout_check(metadata[:user].id)

    if outstanding_entries.length == 0
      back_to_home = ask 'sem_checkin', :timeout => 5, :limit => 1
      if back_to_home.to_s.to_i == 1
        invoke Home
      else
        hangup
      end
    elsif outstanding_entries.length == 1
      checkout_confirmation = ask 'confirmar_checkout', :timeout => 5, :limit => 1
      
      if checkout_confirmation.to_s.to_i == 1
        begin
          #play 'obrigado'
          checkout = WebService.checkout(metadata[:user].id, outstanding_entries.first['space_number'])
          play 'obrigado' if checkout[:success]
        rescue Exception => e
          hangup
          raise "Checkout nao foi realizado - #{e}"
        end
      else
        hangup
      end

    elsif outstanding_entries.length > 1
      
    end
    

    

  end
end
