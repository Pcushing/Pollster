class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :edit_url
      t.string :name

      t.timestamps
    end
  end
end
