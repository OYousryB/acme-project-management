class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.belongs_to :project
      t.belongs_to :employee
      t.timestamps
    end
  end
end
