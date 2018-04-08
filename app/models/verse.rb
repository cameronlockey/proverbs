class Verse < ApplicationRecord

  belongs_to :book
  belongs_to :version

  self.table_name = 'proverbs'

end
