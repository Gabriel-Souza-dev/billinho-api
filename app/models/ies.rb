class Ies < ApplicationRecord

    validates :nome, presence: true, uniqueness: true
    validates :cnpj, presence: true, numericality: {only_integer: true}, uniqueness: true

end
