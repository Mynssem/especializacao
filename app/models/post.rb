class Post < ApplicationRecord
  belongs_to :usuario
  has_many :comentarios, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :conteudo, presence: true, length: { in: 1..140 }

  def ultima_atualizacao
    data = "#{updated_at.day}/#{updated_at.month}/#{updated_at.year}"
    hora = "#{updated_at.hour}:#{updated_at.min}"
    "#{data}-#{hora}"
  end
end
