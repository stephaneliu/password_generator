require 'securerandom'

module PasswordListGenerator
  class Generator
    attr_accessor :characters_set, :config

    def initialize(config)
      @config = config
      build_characters_set
    end

    def generate
      passwords = []

      1.upto(config.count) do
        valid  = false
        random = ''

        until valid
          random_size = (config.min..config.max).to_a.shuffle.first
          random      = (1..random_size).map {|a| characters_set[SecureRandom.random_number(characters_set.size)]}.join
          password    = Password.new(random, config)

          if password.valid?
            passwords << password
            valid = true 
          end
        end
      end

      passwords
    end

    private

    def build_characters_set
      @characters_set = ('a'..'z').to_a
      @characters_set += ('A'..'Z').to_a if config.uppercase
      @characters_set += ('0'..'9').to_a if config.numeric
      @characters_set += %w(! @ # $ % ^ & * _ +) if config.symbol
      remove_ambiguous_characters
    end

    def remove_ambiguous_characters
      @characters_set -= %w(i o O 1 l 0 I)
    end
  end
end
