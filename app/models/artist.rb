class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    Song.first.genre
  end

  def song_count
    #return the number of songs associated with the artist
    counted = Song.all.select{|song| song.artist == self}
    counted.count
  end

  def genre_count
    #return the number of genres associated with the artist
    songs = Song.all.select{|song| song.artist == self}
    genre = songs.map{|song| song.genre}
    genre.count
  end
end
