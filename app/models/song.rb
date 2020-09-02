
class Song < ActiveRecord::Base
  require 'pry'
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    #if Artist.all.include?("Drake")
    if Artist.where("name = 'Drake'").length > 0
      make_drake = Artist.where("name = 'Drake'")
      #binding.pry
      self.artist = make_drake[0]
     
    else
      first = Artist.create(name: "Drake")
      self.artist = first
    end
   # binding.pry
  end
end