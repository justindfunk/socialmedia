class InterestsController < ApplicationController
#  respond_to :, only: [ :create ]

  def create
    @interest = Interest.new(interest_params)
    @interest.user = current_user
    @interest.rating = 1.0

    respond_to do |format|
      if current_user.hooks.include?(@interest.hook) || (!current_user.hooks.include?(@interest.hook) && @interest.save)
        format.html {redirect_to @interest.hook }
        format.js { render @interest.hook, status: :created, location: @new_hook }
      else
        format.js { render json: @hook.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:hook_id)
  end
end