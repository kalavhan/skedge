class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :state
      t.string :city
      t.string :zip_code
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
