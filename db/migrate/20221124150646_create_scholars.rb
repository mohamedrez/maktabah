class CreateScholars < ActiveRecord::Migration[7.0]
  def change
    create_table :scholars do |t|
      t.string :full_name
      t.text :bio

      t.timestamps
    end
  end
end
