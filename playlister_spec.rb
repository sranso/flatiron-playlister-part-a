require './lib/artist'
require './lib/genre'
require './lib/song'

describe "playlister" do
  it '1 Can initialize an Artist' do
    lambda {Artist.new}.should_not raise_error
  end

  it '2 An artist can have a name' do
    artist = Artist.new
    artist.name = "Adele"
    artist.name.should eq("Adele")
  end

  it "3 An artist has songs" do
    artist = Artist.new
    artist.songs = []
    artist.songs.should eq([])
  end

  it '4 The Artist class can reset the artists that have been created' do
    lambda {Artist.reset_artists}.should_not raise_error
    Artist.count.should eq(0)
  end

  it '5 The Artist class can keep track of artists as they are created' do
    Artist.reset_artists
    artist = Artist.new
    Artist.all.should include(artist)
  end

  it '6 The Artist class can count how many artists have been created' do
    lambda {Artist.count}.should_not raise_error
  end

  it '7 artists have songs' do
    artist = Artist.new
    songs = (1..4).collect{|i| Song.new}
    artist.songs = songs

    artist.songs.should eq(songs)
  end

  it '8 An artist can count how many songs they have' do
    artist = Artist.new
    songs = [Song.new, Song.new]
    artist.songs = songs

    artist.songs_count.should eq(2)
  end

  it '9 a song can be added to an artist' do
    artist = Artist.new
    song = Song.new
    artist.add_song(song)

    artist.songs.should include(song)
  end

  it '10 artists have genres' do
    artist = Artist.new
    song = Song.new
    genre = Genre.new
    genre.name = "rap"
    song.genre=(genre)
    artist.add_song(song)

    artist.genres.should include(song.genre)
  end

  # Genre Specs
  it '11 Can initialize a genre' do
    lambda {Genre.new}.should_not raise_error
  end

  it '12 A genre has a name' do
    genre = Genre.new
    genre.name = 'rap'

    genre.name.should eq('rap')
  end

  it '13 A genre has many songs' do
    genre = Genre.new.tap{|g| g.name = 'rap'}
    [1,2].each do
      song = Song.new
      song.genre = genre
    end

    genre.songs.count.should eq(2)
  end

  it '14 A genre has many artists' do
    genre = Genre.new.tap{|g| g.name = 'rap'}

    [1,2].each do
      artist = Artist.new
      song = Song.new
      song.genre = genre
      artist.add_song(song)
    end

    genre.artists.count.should eq(2)
  end
  #whenever an artist 'receives' a song, the song's
  #genre should be added to that artists' genre array

  it '15 A genres Artists are unique' do
    genre = Genre.new.tap{|g| g.name = 'rap'}
    artist = Artist.new

    [1,2].each do
      song = Song.new
      song.genre = genre
      artist.add_song(song)
    end

    genre.artists.count.should eq(1)
  end

  # Same behavior as Artists
  it '16 The Genre class can keep track of all created genres' do
    Genre.reset_genres # You must implement a method like this
    genres = [1..5].collect do |i|
      Genre.new
    end

    Genre.all.should eq(genres)
  end

  # Extra Credit
  # Complete any song test that is pending (undefined).

  it '17 Can initialize a song' do
    expect(Song.new).to_not raise_error
  end

  it '18 A song can have a name aka title' do
    newsong = Song.new
    newsong.title="Sarah's Favorite Song"
    expect(newsong.title).to eq("Sarah's Favorite Song")
  end

  it '19 A song can have a genre' do
    newsong = Song.new
    newgenre = Genre.new
    newsong.genre=(newgenre)
    expect(newsong.genre).to eq(newgenre)
  end

  it '20 A song has an artist' do
    newsong = Song.new
    newgenre = Genre.new
    newartist = Artist.new
    newsong.artist=(newartist)
    expect(newsong.artist).to eq(newartist)
  end
end
