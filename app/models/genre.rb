class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    counted = Song.all.select{|song| song.genre == self}
    counted.count
  end

  def artist_count
    # return the number of artists associated with the genre
    songs = Song.all.select{|song| song.genre == self}
    artist = songs.map{|song| song.artist}
    artist.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    self.artists.collect do |t|
      t.name
    end
  end
end
