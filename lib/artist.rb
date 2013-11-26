class Artist
  attr_accessor :name, :songs

  ARTISTS = []

  def initialize
    @name = name
    @songs = []
    ARTISTS << self
  end

  def reset_artists
    ARTISTS.clear
  end

  def count
    ARTISTS.size
  end

  def all
    puts ARTISTS
  end

  
end