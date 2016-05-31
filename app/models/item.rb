class Item < ActiveRecord::Base
  belongs_to :parent, class_name: "Item"
  has_many :children, -> { order(:position) }, class_name: "Item", foreign_key: :parent_id

  validates :title, presence: true

  scope :roots, -> { where(parent_id: nil) }
end
