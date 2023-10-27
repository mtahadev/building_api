class CreateCustomFields < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_fields do |t|
      t.string :field_name
      t.string :field_type
      t.string :field_value
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
