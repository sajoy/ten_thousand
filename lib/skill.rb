class Skill < ActiveRecord::Base
  has_many :entries,  dependent: :destroy
  validates(:name, presence: true)
  default_scope {order("name ASC")}
  before_save(:capitalize)

  def level
    self.entries.sum(:rating) / 10
  end

  def date
    day = created_at.day
    month = created_at.month
    year = created_at.year
    pretty_date = "#{month}/#{day}/#{year}"
  end

private

  def capitalize
    self.name=(name().titleize())
  end

end
