class CreatePessoas < ActiveRecord::Migration[7.1]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.float :valor_da_carteira

      t.timestamps
    end
  end
end
