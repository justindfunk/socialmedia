class HooksController < ApplicationController
  def show
    current_user.views.create(hook: @hook, start: Time.now)
  end



  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def hook_params
    params.require(:hook).permit(:content)
  end
end