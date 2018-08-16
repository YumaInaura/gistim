module Gistim
  class Create
    def initialize(description: nil, alias_name: nil)
      @alias_name = alias_name
      @description = description
    end
  
    attr_reader :alias_name, :gist_url
 
    def implement
      File.write(initialize_file_path, description)

      @gist_url = create_empty
      clone

      File.delete(initialize_file_path)

      self
    end

    def gist_hash
      gist_url.nil? ? nil : gist_url.chomp.gsub(/\A.+\//, '')
    end

    def description
      @description ||= 'Hello gist!'
    end

    def gist_hash_file_path
      "#{clone_directory}/.gist_hash"
    end

    def gist_url_file_path
      "#{clone_directory}/.gist_url"
    end
 
    private
 
    def clone
      Clone.clone(gist_url, clone_directory: clone_directory)
    end

    def create_empty
      # Execute `$ gist [some_file]` command and get gist url result
      gist_url = `gist #{initialize_file_path}`.chomp

      File.write(gist_url_file_path, gist_url)
      File.write(gist_hash_file_path, gist_hash)

      gist_url
    end

    def initialize_file_path
      '.gistim.tmp'
    end

    def clone_directory
      alias_name || gist_hash
    end
  end
end
