require "pry"
class MP3Importer
  attr_accessor :path
  
  def initialize(file_path)
    @path = file_path
    @files = []
  end
  
  def normalize_file_name (full_path_file_name)
    File.basename(full_path_file_name)
  end
  def files
    @files = Dir.glob("#{@path}/*.mp3")
    @files = @files.map {|e| normalize_file_name(e)}
    
  end

  def import
    files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end
end