class ArticlesController < HooksController
  before_action :set_hook, only: [ :show ]
  before_action :set_parent, only: [ :create ]

  def show
    super
  end

  def create
    @new_hook = Article.new(article_params)
    tags = []
    @new_hook.tags.each do |tag|
      name = tag.name.titlecase
      e_tag = Tag.where(:name => name).first
      unless e_tag.nil?
        unless tags.include?(e_tag)
          tags << e_tag
        end
      else
        new_tag = Tag.create(:name => name)
        tags << new_tag
      end
    end
    @new_hook.tags.delete_all
    @new_hook.tags << tags
    respond_to do |format|
      if @new_hook.save
        current_user.ownerships.create(hook: @new_hook)
        unless @parent == current_user.profile
          current_user.profile.posts << @new_hook
          current_user.profile.save
        end
        format.html { redirect_to (@hook.nil? ? root_url : @hook), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @new_hook }
      else
        format.html { redirect_to (@hook.nil? ? root_url : @hook), notice: @new_hook.errors.full_messages.to_sentence }
        format.json { render json: @hook.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_parent
    unless params[:hook_id].nil?
      @hook = Hook.find(params[:hook_id])
    end
  end

  def set_hook
    @hook = Hook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:name, :content, hyperlinks_attributes: [:url, :_destroy], tags_attributes: [ :name, :_destroy ])
  end
end

