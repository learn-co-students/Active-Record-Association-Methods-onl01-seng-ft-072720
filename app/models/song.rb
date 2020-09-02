class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this 
   if Artist.find_by(name: "Drake") != nil
    drake = Artist.find_by(name: "Drake")
    drake.songs << self 
   else 
    drake = Artist.new 
    drake.name = "Drake" 
    drake.songs << self
    drake.save
   end
  end
end