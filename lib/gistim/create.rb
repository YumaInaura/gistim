module Gistim
  class Create
    def initialize(alias_name: nil)
      @alias_name = alias_name
    end
  
    attr_writer :alias_name
  
    def create
      File.write('README.md', 'Wellcome to Gist! ( created by gistim )')
      self.gist_url = `gist README.md`
      seff.gist_hash = gist_url.chomp.gsub(/\A.+\//, '')
      clone_directory = self.alias_name || gist_hash
      `gistim clone #{gist_url} #{clone_directory}`
      File.delete('README.md')
      File.write("#{clone_directory}/.gist.url", gist_url)
      File.write("#{clone_directory}/.gist.hash", gist_hash)
      self
    end
  
    private
  
    attr_accessor :gist_url, :gist_hash
  
    # public
    class << self
      def implement
        self.class.new.create
      end
    end
  end
end
