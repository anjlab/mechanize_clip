require "mechanize_clip/version"
require "tempfile"
require "mechanize"

module MechanizeClip
  
  # Temfile capatible with paperclip
  class TmpFile < Tempfile
    attr :content_type
    attr :page 

    def initialize page
      @page = page
      ext = File.extname(self.original_filename)
      name = File.basename(self.original_filename, ext)
      super([name, ext])
      self.binmode
      content = @page.content
      if String === content
        self.write content
      else
        until content.eof? do
          self.write content.read 16384
        end
      end
      self.flush
      self.rewind
      @content_type = @page.response['content-type']
    end

    def original_filename
      @original_filename ||= begin
        match = @page.uri.path.match(/^.*\/(.+\..+)$/)  
        match ? match[1] : @page.filename
      end
    end
  end

  # Downloads url contents to temp file using Mechanize
  # returns nil if something bad happend
  def get url
    begin
      get! url
    rescue
      nil
    end
  end

  # Downloads url contents to temp file using Mechanize
  # raise exception if something bad happend
  def get! url
    agent = Mechanize.new
    # agent.max_file_buffer = 0 # always download to temp file
    TmpFile.new agent.get(url)
  end

  module_function :get
  module_function :get!
end
