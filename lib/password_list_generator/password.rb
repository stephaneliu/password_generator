module PasswordListGenerator
  class Password
    extend Forwardable

    delegate [:count, :min, :max, :uppercase, :symbol, :numeric] => :@config

    attr_accessor :password, :config

    def initialize(password, config)
      @password = password
      @config   = config
    end

    def valid?
      special? and numeric? and lowercase? and uppercase? and length?
    end

    def to_s
      password
    end

    private
   
    def special?
      return true unless symbol
      /\W/ === password
    end

    def numeric?
      return true unless numeric
      /\d/ === password
    end

    def lowercase?
      /[a-z]/ === password
    end

    def uppercase?
      return true unless uppercase
      /[A-Z]/ === password
    end

    def length?
      greater_than_min && less_than_max
    end

    def greater_than_min
      password.size >= min
    end

    def less_than_max
      password.size <= max
    end
  end
end
