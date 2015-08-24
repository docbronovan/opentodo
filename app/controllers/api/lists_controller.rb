class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    user = List.new(user_id: User.find(params[:email]).id, title: params[:title])
      if list.save
        render json: list
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
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


end