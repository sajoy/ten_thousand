class Skill < ActiveRecord::Base
  has_many :entries,  dependent: :destroy
  validates(:name, presence: true)
  default_scope {order("name ASC")}
  before_save(:capitalize)

  def level
    self.entries.sum(:rating) / 10
  end

private

  def capitalize
    self.name=(name().titleize())
  end

end
