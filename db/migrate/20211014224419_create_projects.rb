class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :state
      t.references :owner

      t.timestamps
    end
  end
end
