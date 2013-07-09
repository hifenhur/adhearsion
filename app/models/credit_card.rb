#encoding: utf-8
class CreditCard < ActiveRecord::Base
  validates_presence_of [:cvv, :name, :number, :expiration_date]
  attr_accessible :cvv, :expiration_date, :name, :number

  belongs_to :client, class_name: 'UserInfo', foreign_key: 'id_client'
end
