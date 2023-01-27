class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :course, null: false, foreign_key: true
      t.integer :position
      t.references :stepable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
