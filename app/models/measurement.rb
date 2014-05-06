class Measurement < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :mL, presence: true

  def self.convert_mL_to_measurement(mL, measurement_mL)
    (mL / measurement_mL.to_d).round(5)
  end
end
