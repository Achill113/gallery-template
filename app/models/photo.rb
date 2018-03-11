class Property
  class Photo < RGallery::Photo
    def initialize property, options = {}
      super
    end
    alias_method :property, :obj

    def path
      File.join folder, super
    end

    # mogrify -path fullpathto/temp2 -resize 60x60% -quality 60 -format jpg *.png

    # this will take all png files in your current directory (temp),
    # resize to 60% (of largest dimension and keep aspect ratio),
    # set jpg quality to 60 and convert to jpg.
    def thumb
      File.join folder, 'thumbs', file_path
    end

    def folder
      'private/uploads'
    end

    # Here we expect to create each photo with the
    # id being set to a Property object
    def property
      id
    end

    # The filename of the picture.
    # Here it assumes that the id assigned is a Property object, which has a
    # method 'picture' which returns the picture id.
    def filename
      "property-#{property.picture}"
    end

    def title
      property.title
    end

    def alt
      title
    end

    def self.extension
      :jpg
    end
  end
end
