class Images < ActiveRecord::Migration[5.0]
  def change
    def up
      create_table :images
      add_attachment :images, :image
    end
  end
end
