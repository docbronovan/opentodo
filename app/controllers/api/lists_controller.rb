class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    user = User.find(params[:id])
    list = List.user.new(title: params[:name])
      if list.save
        render json: list
      else
        render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def list_params
      params.permit(:permissions, :name, :username, :password)
    end
  

end