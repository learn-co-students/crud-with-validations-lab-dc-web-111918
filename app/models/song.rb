class Song < ActiveRecord::Base
  validates :title, {presence: true, uniqueness: true}
  validates :release_year, presence: true, if: :released?
  validate :validate_release_year

  def validate_release_year
    if release_year.to_i > Time.now.year
      errors.add(:release_year, "Release year must not be in the future.")
    end
  end
end
