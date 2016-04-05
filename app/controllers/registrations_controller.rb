class RegistrationsController < Devise::RegistrationsController

  def resource_name
    :user
  end

  def resource_class
   User
  end

  def resource

    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def new
    build_resource({})
    self.resource.talks ||= Talk.new
    respond_with self.resource
  end



  private
  def sign_up_params
    allow = [:name, :email, :password, :password_confirmation, talks_attributes: [:id, :title, :description, :duration, :speaker, :state, :tag_list, :_destroy]]
    params.require(resource_name).permit(allow)
  end
  # def sign_up_params
  #   params.require(:user).permit! #(:name, :email, :password, :password_confirmation )

  # end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end
