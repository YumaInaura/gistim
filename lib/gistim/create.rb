module Gistim
  class Create
    def initialize(description: nil, alias_name: nil)
      @alias_name = alias_name
      @description = description
    end
  
    attr_reader :alias_name, :url
 
    def implement
      File.write(initialize_file_path, description)

      @url = create_empty
      clone

      File.delete(initialize_file_path)

      self
    end

    def hash
      url.nil? ? nil : url.chomp.gsub(/\A.+\//, '')
    end

    def description
      @description ||= '# Hello Gist!'
    end

    def directory
      "#{Gistim::Command.home}/#{name}"
    end
 
    def name
      alias_name || hash
    end

    private
 
    def clone
      Clone.clone(url, clone_directory: directory)
    end

    def create_empty
      # Execute `$ gist [some_file]` command and get gist url result
      url = `gist #{initialize_file_path}`.chomp

      url
    end

    def initialize_file_path
      'GIST.md'
    end
  end
end
