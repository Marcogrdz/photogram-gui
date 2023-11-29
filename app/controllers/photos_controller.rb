class PhotosController <ApplicationController
  def index
    matching_photos=Photo.all
    @list_of_photos= matching_photos.order ({:created_at => :desc})

    render ({ :template => "photo_templates/index"})
  end

  def show
  url_photo =params.fetch("path_id")
  matching_photo = Photo.where ({ :id=> url_photo})

  @the_photo= matching_photo.at(0)
  render ({ :template => "photo_templates/show"})
  end

  def baii
    the_id =params.fetch("path_id")
    matching_photo = Photo.where ({ :id=> the_id})
  
    the_photo= matching_photo.at(0)

    the_photo.destroy

    redirect_to ("/photos")
    end

  def create
    new_photo = Photo.new
    new_photo.image = params.fetch("query_image")
    new_photo.caption = params.fetch("query_caption")
    new_photo.owner_id = params.fetch("query_owner_id")
    
    new_photo.save
      
    redirect_to ("/photos/"+ new_photo.id.to_s)
  end
end
