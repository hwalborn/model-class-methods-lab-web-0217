class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    joins(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    joins(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end

  def self.talented_seamen
    joins(boats: :classifications).where(classifications: {name: "Motorboat"}, boats: {captain_id: sailors.pluck(:id)})
  end

  def self.non_sailors
    all.where.not(captains: {name: sailors.pluck(:name)})
  end
end
