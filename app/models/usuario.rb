class Usuario < ApplicationRecord 
  has_secure_password
  
  validates :nome, presence: true, length: { in: 2..20 }
  validates :sobrenome, presence: true, length: { in: 2..50}
  validates :email, presence: true, length: { in: 5..50 }, uniqueness: true
  validates :telefone, presence: true, numericality: { only_integer: true }, length: { in: 8..15 }
  validates :data_nascimento, presence: true
  validates :password, length: { in: 6..12}, allow_nil: true

end
