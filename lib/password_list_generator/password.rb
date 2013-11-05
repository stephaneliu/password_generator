module PasswordListGenerator
  class Password
    attr_accessor :password, :config

    def initialize(password, config)
      @password = password
      @config   = config
    end

    def valid?
      has_special? and has_numeric? and has_lowercase? and has_uppercase? and correct_length?
    end

    def to_s
      password
    end

    private
   
    def has_special?
      config.symbol ? /\W/ === password : true
    end

    def has_numeric?
      config.numeric ? /\d/ === password : true
    end

    def has_lowercase?
      /[a-z]/ === password
    end

    def has_uppercase?
      config.uppercase ? /[A-Z]/ === password : true
    end

    def correct_length?
      password.size >= config.min and password.size <= config.max
    end
  end
end
