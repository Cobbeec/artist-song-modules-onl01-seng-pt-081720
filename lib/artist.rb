# require 'pry'

# class Artist
#   extend Memorable::ClassMethods
#   include Memorable::InstanceMethods
#   extend Findable
#   include Paramable 
#   # extend Memorable 
#   attr_accessor :name
#   attr_reader :songs

#   @@artists = []

#   def initialize
#     # self.class.all << self
#     super
#     @songs = []
# end

#   # def self.find_by_name(name)
#   #   @@artists.detect{|a| a.name == name}
#   # end

#   def self.all
#     @@artists
#   end

#   # def self.reset_all
#   #   self.all.clear
#   # end

#   # def self.count
#   #   self.all.count
#   # end

# #   def add_song(song)
# #     @songs << song
# #     song.artist = self
# #   end

# #   # def add_songs(songs)
# #   #   songs.each { |song| add_song(song) }
# #   # end

# # def add_song(song)
# #     @songs << song
# #     song.artist = self
# #     songs.each { |song| add_song(song) }
# #   end

#   def add_song(song)
#     @songs << song
#     song.artist = self unless song.artist
#   end

#   def add_songs(songs)
#     songs.each { |song| add_song(song) }
#   end

#   def to_param
#     name.downcase.gsub(' ', '-')
#   end
# end


class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  @@artists = []
  
  def self.all
    @@artists
  end

  def initialize
    super
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self unless song.artist
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

end
