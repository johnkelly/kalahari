class CurrentUserSerializer < ActiveModel::Serializer
  root :user
  attributes :id, :email, :auth_token, :first_name
end
