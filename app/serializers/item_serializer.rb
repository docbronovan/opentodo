class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :list_id, :created_at, :complete

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
