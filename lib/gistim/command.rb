module Gistim
  class Command
    def self.home
      path = if ENV['GISTIM_HOME']
        ENV['GISTIM_HOME']
      elsif ENV['HOME']
        "#{ENV['HOME']}/gistim"
      else
        './gistim'
      end

      FileUtils.mkpath(path)
      path
    end
  end
end

