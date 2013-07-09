# encoding: utf-8

class Home < Adhearsion::CallController

  attr_accessor :user

  def run
    answer
    user_exist = false
    while !user_exist
      @codigo = ask 'codigo-fem', :timeout => 10, :limit => 1
      if verifica_usuario(@codigo)
        user_exist = true
      end
    end

    menu "menu-principal", :tries => 2, :timeout => 10 do
      match 1 do 
      pass Saldo, {:user => self.user}
      end
      match 2, EscolherVaga
    end

  end

  

  def verifica_usuario(codigo)
    @codigo = @codigo.response.to_i
    
    if self.user = User.where(:id => @codigo).first
      return true
    else
      play 'codigo-incorreto'
      return false
    end
  end

 
end
