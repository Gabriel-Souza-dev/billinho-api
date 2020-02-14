class Aluno < ApplicationRecord
    validates :nome,             presence: true, uniqueness: true
    validates :cpf,              presence: true, numericality: {only_integer: true}, uniqueness: true
    validates :genero,           presence: true, inclusion: {in: %w(M F)}
    validates :metodo_pagamento, presence: true


end
