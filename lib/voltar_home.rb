# encoding: utf-8

class VoltarHome < Adhearsion::CallController
  def run
    menu "voltar-home", :tries => 2, :timeout => 10 do
      match 1, Home
    end
  end
end
