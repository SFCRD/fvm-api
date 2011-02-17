class CreateBuilds < ActiveRecord::Migration
  def self.up
    create_table :builds do |t|
      t.string :version
      t.string :sdk
      t.string :milestone
      t.string :description
      t.date :date
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :builds
  end
end
