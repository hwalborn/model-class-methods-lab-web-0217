class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    all.uniq
  end

  def self.longest
    joins(:boats).where("length = ?",Boat.all.maximum(:length))
  end
end
