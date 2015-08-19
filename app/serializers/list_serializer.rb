class ListSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
