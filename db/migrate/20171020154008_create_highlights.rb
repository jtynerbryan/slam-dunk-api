class CreateHighlights < ActiveRecord::Migration[5.1]
  def change
    create_table :highlights do |t|
      t.string :title
      t.datetime :date_created
      t.string :media
      t.string :permalink
      t.string :url
    end
  end
end
