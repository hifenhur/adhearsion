# encoding: utf-8

class Usuario < Adhearsion::CallController
  def run
  	menu "menu-principal", :tries => 2, :timeout => 10 do
      match 1, Saldo

      match 2, EscolherVaga

    end
  end
end
