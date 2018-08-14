module Gistim
  class Create
    def initialize(alias_name: nil)
      @alias_name = alias_name
    end
  
    attr_reader :alias_name
 
    def create
      File.write(initialize_file_path, 'Wellcome to Gist! ( created by gistim )')

      create_empty
      clone

      File.delete(initialize_file_path)
 
      # FIME: write good structured work flow and good test
      # File.write("#{clone_directory}/.gist.url", gist_url)
      # File.write("#{clone_directory}/.gist.hash", gist_hash)

      self
    end

    def gist_hash
      gist_url.chomp.gsub(/\A.+\//, '')
    end
  
    private
 
    def clone
      Clone.clone(gist_url, clone_directory: clone_directory)
    end

    def create_empty
      # Execute `$ gist [some_file]` command and get gist url result
      @gist_url ||= `gist #{initialize_file_path}`.chomp
    end

    def gist_url
      @gist_url ||= create_empty
    end

    def initialize_file_path
      '.gistim.tmp'
    end

    def clone_directory
      alias_name || gist_hash
    end

    # public
    class << self
      def implement
        self.class.new.create
      end
    end
  end
end
