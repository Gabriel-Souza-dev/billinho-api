class Matricula < ApplicationRecord
  belongs_to :ies 
  belongs_to :aluno

  validates  :nome_curso,  presence: true
  validates  :ies_id,      presence: true
  validates  :aluno_id,    presence: true



end
