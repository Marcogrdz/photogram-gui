class UsersController <ApplicationController
  def index
    matching_users=User.all
    @list_of_users= matching_users.order ({:username => :asc})

    render ({ :template => "user_templates/index"})
  end

  def show
  url_username =params.fetch("path_username")
  matching_username = User.where ({ :username=> url_username})

  @the_user= matching_username.at(0)
  render ({ :template => "user_templates/show"})
  end
end
