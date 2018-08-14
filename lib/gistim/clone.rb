module Gistim
  class Clone
    def initialize(alias_name: nil)
    end
  
    def self.clone(hash_or_url, clone_directory: nil)
       hash = hash_or_url.match(/[a-z0-9]+\z/)[0]
      `git clone git@gist.github.com:#{hash} #{clone_directory}`
    end
  end 
end
