class CurrentUserSerializer < ActiveModel::Serializer
  root :user
  attributes :id, :email, :auth_token, :first_name, :gravatar

  def gravatar
    "https://secure.gravatar.com/avatar/#{gravatar_hash}?d=identicon"
  end

  private

  def gravatar_hash
    Digest::MD5.hexdigest(object.email.downcase.strip)
  end
end
