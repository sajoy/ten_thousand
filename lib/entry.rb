class Entry < ActiveRecord::Base
  belongs_to :skill
  belongs_to :category
  validates(:title, presence: true)
  validates(:rating, inclusion: 1..5)
  default_scope {order("created_at DESC")}


  def date
    day = created_at.day
    month = created_at.month
    year = created_at.year
    pretty_date = "#{month}/#{day}/#{year}"
  end

end
