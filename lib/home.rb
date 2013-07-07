# encoding: utf-8

class Home < Adhearsion::CallController

  def run
    answer

    codigo = ask 'codigo-usuario', :timeout => 10, :limit => 5

    u = User.find(codigo.result.to_i)
    username_file = "ola-#{u.nome.parameterize}"
    criar_som("Olá, #{u.nome}", username_file)
    play username_file

    menu "menu-principal", :tries => 2, :timeout => 10 do
      match 1, Saldo

      match 2, EscolherVaga

    end

  end

  def criar_som(text, filename)
    text.to_file "pt-br", "/tmp/#{filename}.mp3"
    system("sox /tmp/#{filename}.mp3 -r 8000 -c 1 /var/lib/asterisk/sounds/en/#{filename}.gsm resample -ql")
  end

  def receber_usuario(codigo)
    id = codigo.to_i
    if u = User.find(id)
      
    end
    
  end
end
