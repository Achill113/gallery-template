class ChangeImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :image_file_name, :varchar
    remove_column :images, :image_content_type, :varchar
    remove_column :images, :image_file_size, :integer
    remove_column :images, :image_uploaded_at, :datetime
    
  end
end
