class Song
  
  attr_accessor :name, :artist
  
  def initialize(name)
    self.name = name
  end
  
  def self.new_by_filename(file_name)
    arr = file_name.split(/ - |.mp3/)
    # arr[0] = artist_name
    # arr[1] = song name
    # arr[2] = genre
    
    song = Song.new(arr[1])
    artist = Artist.find_or_create_by_name(arr[0])
    artist.add_song(song)
    song.artist = artist
    song
  end
end