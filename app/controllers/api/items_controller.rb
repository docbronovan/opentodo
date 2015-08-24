class Api::ItemssController < ApiController
  before_action :authenticated?

  def create
    item = Item.new(user_id: User.find(params[:email]).id, list_id: List.find(params[:list]).id, description: params[:description])
      if item.save
        render json: item
      else
        render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
      end
  end


  private
    def item_params
      params.require(:list).permit(:description)
    end
  
end