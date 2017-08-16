class MP3Importer
  attr_reader :path
  attr_accessor :song

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end

end
