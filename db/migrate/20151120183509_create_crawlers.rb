class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :name
      t.string :description
      t.text :input_params
      t.string :classname

      t.timestamps null: false
    end
  end
end
