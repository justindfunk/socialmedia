class TagsController < ApplicationController
  before_action :set_hook, only: [ :show ]
  respond_to :json, only: [ :index ]

  def index
    respond_to do |format|
      format.html {
        @hooks = Tag.all
        render 'index'
      }
      format.json { render :json => Tag.where('name like ?', "%#{params[:term]}%").map{ |t| t.name } }
    end
  end

  def show

  end

  private

  def set_hook
    @hook = Tag.find(params[:id])
  end
end