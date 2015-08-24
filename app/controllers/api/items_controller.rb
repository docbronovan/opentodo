class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = @current_user.lists.find(params[:list_id])
    item = list.items.new(description: item_params[:description], complete: item_params[:complete]) 
    #user_id: User.find(params[:email]).id,
      if item.save
        render json: item
      else
        render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def update
      item = @current_user.items.find(params[:id])
      if item.update(item_params)
        render json: item
      else
        render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
      end
    end

  private
    def item_params
      params.require(:item).permit(:description, :complete)
    end
  
end