class PhotosController <ApplicationController
  def index
    matching_photos=Photo.all
    @list_of_photos= matching_photos.order ({:created_at => :desc})

    render ({ :template => "photo_templates/index"})
  end

  def show
  url_username =params.fetch("path_username")
  matching_username = User.where ({ :username=> url_username})

  @the_user= matching_username.at(0)
  render ({ :template => "user_templates/show"})
  end
end
