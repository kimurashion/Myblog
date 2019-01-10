class MypageController < ApplicationController
  def edit
  end
  
  def update
    Rails.logger.debug("########### params")
    Rails.logger.debug(params)

    if current_user.update({username: params[:user][:username]})
      redirect_to root_path
    else
      render 'edit'
    end
  end
end
