class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :receiver_id
      t.integer :payer_id
      t.integer :amount
      t.string :description
      t.boolean :fulfilled
      t.timestamps null: false
    end
  end
end