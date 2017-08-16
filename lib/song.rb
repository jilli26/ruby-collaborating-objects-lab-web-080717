require "pry"
class Song

  attr_accessor :name, :artist, :files, :songs

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    #look through all the files
    #what are the song and artist names
    artist_name = file_name.split(" - ")[0]
    song_name = file_name.split(" - ")[1]

    new_song = Song.new(song_name)
    the_artist = Artist.find_or_create_by_name(artist_name)
    
    new_song.artist = the_artist
    the_artist.add_song(new_song)

    new_song

  end
end
