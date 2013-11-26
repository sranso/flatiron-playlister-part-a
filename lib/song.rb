class Song

  attr_reader :genre

  def initialize
    @title
    @genre

  end

  def genre=(genre_of)
    @genre = genre_of
    # Genre.new.tap{|g| g.name = "rap"}
  end

end