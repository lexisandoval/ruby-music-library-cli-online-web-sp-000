class Artist

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def genres
    @new = []
    @songs.each do |song|
      if @new.include?(song.genre)
        nil
      else
        @new << song.genre
      end
    end
      @new
  end


  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end

  def songs
    @songs
  end



  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end
end
