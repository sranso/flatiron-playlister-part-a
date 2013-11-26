class Genre

  attr_accessor :name#, :songs
  # attr_reader :songs
  GENRES = []

  def initialize
    @name = name
    @songs = []
    @artists = []
    GENRES << self
  end

  def songs
    @songs #just the array
  end

  def artists
    @artists
  end

  def self.all
    GENRES
  end

  def self.reset_genres
    GENRES.clear
  end

end
