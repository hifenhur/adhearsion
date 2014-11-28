# encoding: utf-8
require 'sound_helper'
class EscolherVaga < Adhearsion::CallController
  include SoundHelper
  def run
    unless metadata[:to_menu]
      tent = 0
      vaga = ""
      while vaga.to_s.empty?
        vaga = ask 'digitar-vaga', :timeout => 5, :limit => 10, :terminator => '*'
        tent = tent + 1
        if tent > 2
          play 'obrigado'
          hangup
        end

      end
      #pra que a vaga não seja salva com outro tipo de caractere alem de numero
      vaga = vaga.to_s.parameterize


      play "vaga-digitada"
      vaga.to_s.to_i.to_extenso.parameterize.gsub("-", " ").split(" ").each do |n|
         play n
      end
    end

    vaga = metadata[:vaga] if metadata[:vaga]
    

    menu "confirmar-vaga-menu", :tries => 2, :timeout => 7 do |input|
      match 1 do
        parking_requisition = WebService.reserve_vacancy( metadata[:user].id, vaga, call[:x_agi_callerid])
        if parking_requisition.is_a? TrueClass
          play 'obrigado'
        elsif parking_requisition.is_a? Hash
            if parking_requisition["work_time"]
              play 'fora_do_horario'
            elsif parking_requisition["in_use"]
              play 'vaga_em_uso'
            end
        else
          play 'vaga-inexistente'
          pass EscolherVaga, {:user => metadata[:user]}
        end
      end
      match 2 do
        play "vaga-digitada"
        vaga.to_s.to_i.to_extenso.parameterize.gsub("-", " ").split(" ").each do |n|
          play n
        end
        invoke EscolherVaga, {:to_menu => true, :vaga => vaga, :user => metadata[:user]}
      end
      match 3 do
        pass EscolherVaga, {:user => metadata[:user]}
      end
      invalid do
        invoke EscolherVaga, {:to_menu => true, :vaga => vaga, :user => metadata[:user]}
      end
      timeout do
        play 'obrigado'
      end

    end

  end
end
