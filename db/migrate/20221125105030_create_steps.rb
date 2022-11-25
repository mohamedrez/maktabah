class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.integer :position
      t.references :course, null: false, foreign_key: true
      t.references :stepable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
