class Weighing < ApplicationRecord
  belongs_to :user
  belongs_to :branch
  belongs_to :costcenter
  belongs_to :employee
  belongs_to :vehicle

  has_one_attached :coupon
  validates :coupon, attached: true, content_type: %i[JPG JPEG], size: {less_than: 2.megabytes}
  validates :dia, :hora, :weight_in, :weight_out, :numbercupom, presence: true

end
