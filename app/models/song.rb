class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year},
  allow_nil: true 
  validates :title, uniqueness: {scope: :release_year, scope: :artist_name}

end
