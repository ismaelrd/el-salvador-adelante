class CreateHomeVideos < ActiveRecord::Migration
  def change
    create_table :home_videos do |t|
      t.string :url, null: false, default: ''

      t.timestamps
    end
  end
end
