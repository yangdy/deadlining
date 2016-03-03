class Bookmark < ActiveRecord::Base
  validates_presence_of :title, :link
end
