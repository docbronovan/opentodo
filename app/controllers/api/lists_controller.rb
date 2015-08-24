class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    #user = User.find_by_email(list_params[:username])
    #user = params[:user_id]
    list = @current_user.lists.new(title: list_params[:name], permissions: list_params[:permissions])
      if list.save
        render json: list
      else
        render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def destroy
    begin
      list = @current_user.lists.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  def update
    list = @current_user.lists.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def list_params
      params.require(:list).permit(:name,:permissions)
    end
  

end