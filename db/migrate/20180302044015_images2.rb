class Images2 < ActiveRecord::Migration[5.0]
  def change
    create_table :images
    add_attachment :images, :image
  end
end
