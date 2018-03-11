class PropertiesController < ApplicationController
  def show
    @property = property
  end

  protected

  def property
    Hashie::Mash.new  title: 'A beautiful property',
                      description: decription,
                      photos: photos
  end

  def description
    %q{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mauris arcu, auctor ac rhoncus non,  libero. Nulla dolor velit, volutpat a bibendum ut, hendrerit id mi. Pellentesque convallis erat in mi interdum rutrum. Phasellus interdum velit nulla.
    }
  end  

  def photos
    @photos ||= RGallery::Photos.new nil, photo_class: Property::Photo
    5.times do |n|
      # using a paginator to get a page of properties
      @photos.pages << Property.page(n)
    end
    @photos
  end
end
