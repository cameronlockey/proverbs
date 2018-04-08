class Version < ApplicationRecord
  self.table_name = 'bible_versions'
  has_many :verses

  def display_name
    "#{self.name} (#{self.abbreviation})"
  end
end
