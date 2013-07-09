# encoding: utf-8
require 'sound_helper'
class Saldo < Adhearsion::CallController
  extend SoundHelper
  attr_accessor :user

  def run
    amount = metadata[:user].total_amount.amount
    if amount.to_i > 0
      saldo = amount.to_s.split('.')
      saldo_reais = "numero-#{saldo[0]}"
      Saldo.criar_som("#{saldo[0]}", saldo_reais)
      saldo_centavos = "numero-#{saldo[1]}"
      if saldo[1].length == 1
        saldo[1][1] = '0'
      end
      Saldo.criar_som("#{saldo[1]}", saldo_centavos)

      play 'voce-tem'
      play saldo_reais
      play 'reais-e'
      play saldo_centavos
      play 'centavos'
      pass VoltarHome
    else
      play 'sem-saldo'
      pass VoltarHome
    end	    
	
  end
end
