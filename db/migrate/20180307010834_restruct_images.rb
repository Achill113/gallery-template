class RestructImages < ActiveRecord::Migration[5.0]
  def change
    drop_table :images
    create_table :images do |img|
      img.string :url
    end
  end
end
