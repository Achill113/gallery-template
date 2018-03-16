require 'aws-sdk-s3'

class GalleryController < ApplicationController

  def index
    s3 = Aws::S3::Resource.new(region: 'us-east-2')
    image_bucket = s3.bucket('promisesoftheheart')
    @images = image_bucket.objects.limit(10)
    @local_images = Image.all
  end

  def upload
    uploaded_io = params[:img]
    file_name = Rails.root.join('private', 'uploads', uploaded_io.original_filename)
    File.open(file_name, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @image = Image.create({url: file_name})
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
