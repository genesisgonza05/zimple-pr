class Journalist < ActiveRecord::Base

  validates :name, :media, :presence => true

end
