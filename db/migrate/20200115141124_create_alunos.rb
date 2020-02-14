class CreateAlunos < ActiveRecord::Migration[6.0]
  def change
    create_table :alunos do |t|
      t.text :nome
      t.text :cpf
      t.date :data_nasc
      t.integer :celular
      t.text :genero
      t.text :metodo_pagamento

      t.timestamps
    end
  end
end
