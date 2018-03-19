class GalleryController < ApplicationController

  def index
    @local_images = Image.all
  end

  def upload
    uploaded_io = params[:img]
    file_name = Rails.root.join('private', 'uploads', uploaded_io.original_filename)
    img_size = FastImage.size(uploaded_io)
    File.open(file_name, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @image = Image.create({url: file_name, width: img_size[0], height: img_size[1]})
    redirect_to :back
  end

  def display
    @image = Image.find(params[:id])
    args = params[:inline] ? {disposition: 'inline', type: 'image/png'} : {}
    send_file @image.url, args
  end

  def link
    @image = Image.find(params[:id])
    return @image.url
  end

end
