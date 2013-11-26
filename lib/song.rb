class Song

  attr_reader :genre

  def initialize
    @title = ""
    @genre
    @artist
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.songs << self unless genre_obj.songs.include? self
    # Genre.new.tap{|g| g.name = "rap"}
  end

  def artist
    @artist
  end

end