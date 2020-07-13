require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end #self.create

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end #self.new_by_name

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end #self.create_by_name

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end #self.find_by_name

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end #if
  end #self.find_or_create_by_name

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end #self.alphabetical

  def self.new_from_filename(filename)
    artist_name = filename.split(' - ')[0]
    song_name = filename.split(' - ')[1].split('.mp3')[0]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end #self.new_from_filename

  def self.create_from_filename(filename)
    artist_name = filename.split(' - ')[0]
    song_name = filename.split(' - ')[1].split('.mp3')[0]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end #self.create_from_filename

  def self.destroy_all
    self.all.clear
  end #self.destroy_all

end
