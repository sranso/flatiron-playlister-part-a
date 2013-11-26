class Artist
  attr_accessor :name, :songs, :genres, :count

  ARTISTS = []

  def initialize
    @name = name
    @songs = []
    @genres = []
    ARTISTS << self
  end

  def self.reset_artists
    ARTISTS.clear
  end

  def self.count
    ARTISTS.size
  end

  def self.all
    ARTISTS
  end

  def songs_count
    songs.size
  end

  def add_song(song)
    songs << song
  end

  def genres
    song.genre
  end
  
end