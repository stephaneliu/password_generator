module PasswordListGenerator
  class Password
    attr_accessor :password, :symbol, :numeric, :uppercase, :min, :max

    def initialize(config)
      @password  = ''
      @symbol    = config.symbol || false
      @numeric   = config.numeric || false
      @uppercase = config.uppercase || false
      @min       = config.min || 5
      @max       = config.max || 15
    end

    def valid?
      has_special? and has_numeric? and has_lowercase? and has_uppercase? and correct_length?
    end

    def to_s
      password
    end

    private
   
    def has_special?
      symbol ? /\W/ === password : true
    end

    def has_numeric?
      numeric ? /\d/ === password : true
    end

    def has_lowercase?
      /[a-z]/ === password
    end

    def has_uppercase?
      uppercase ? /[A-Z]/ === password : true
    end

    def correct_length?
      password.size >= min and password.size <= max
    end
  end
end
