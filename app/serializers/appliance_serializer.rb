class ApplianceSerializer < ActiveModel::Serializer
  attributes :id, :kind, :owned?

  def owned?
    if options[:user_appliance_ids].present?
      options[:user_appliance_ids].include?(object.id)
    else
      false
    end
  end
end
