class OrderQueryForm
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :menu_id

  validates :menu_id, presence: true

  def attributes
    { menu_id: self.menu_id }
  end

  def menu_attrs
    { id: self.menu_id }
  end
end
