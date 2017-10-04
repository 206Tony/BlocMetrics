class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :registered_application_id
      t.references :registered_application, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
