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

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil && !@songs.include?(song)
      song.artist = self
      @songs << song
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

end
