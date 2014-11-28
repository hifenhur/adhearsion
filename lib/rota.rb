# encoding: utf-8
class Rota < Adhearsion::CallController
  def run
    #Rotas
    # 1 - Checkin
    # 2 - Checkout
    self.route = ask 'escolher_checkin_ou_checkout', :timeout => 5, :limit => 1
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
