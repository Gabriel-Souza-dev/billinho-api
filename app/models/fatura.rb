class Fatura < ApplicationRecord
  belongs_to :matricula

  validates :valor,           presence: true
  validates :data_vencimento, presence: true
  validates :matricula_id,    presence: true
  validates :status,          presence: true, inclusion: {in: %w(Aberta Atrasada Paga)}


end
