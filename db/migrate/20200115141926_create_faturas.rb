class CreateFaturas < ActiveRecord::Migration[6.0]
  def change
    create_table :faturas do |t|
      t.decimal :valor
      t.date :data_vencimento
      t.references :matricula, null: false, foreign_key: true
      t.text :status

      t.timestamps
    end
  end
end
