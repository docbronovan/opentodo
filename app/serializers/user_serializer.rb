class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :full_name, :email, :bio

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end