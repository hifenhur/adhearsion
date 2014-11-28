#encoding: utf-8
class Client < ActiveRecord::Base
  self.table_name = "client"
  validates_presence_of :cpf, :rg, :organ_dispatcher
  
  

  has_one :user, class_name: 'User', foreign_key: 'client_id'
  has_one :card, class_name: 'CreditCard', foreign_key: 'id_client'
  has_many :total_amount, foreign_key: 'id_client'
  has_many :parking_validations
  has_many :transactions
  has_many :phones, foreign_key: 'id_client'
  has_many :cards, foreign_key: 'id_client'

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :card

  def current_amount
    self.total_amount.last
  end

end
