class GroupsController < HooksController

  def index
    @hooks = Group.all
  end


end