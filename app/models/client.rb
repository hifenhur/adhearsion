#encoding: utf-8
class Client < ActiveRecord::Base
  self.table_name = "client"
  validates_presence_of :cpf, :rg, :organ_dispatcher
  
  attr_accessible :cep, :cpf, :endereco, :name, :organ_dispatcher, :surname, :address, :rg, :user_attributes, :card_attributes

  has_one :user, class_name: 'User', foreign_key: 'client_id'
  has_one :card, class_name: 'CreditCard', foreign_key: 'id_client'
  has_one :total_amount
  has_many :parking_validations
  has_many :transactions

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :card
end
