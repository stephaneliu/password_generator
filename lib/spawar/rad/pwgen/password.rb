# This script requires ruby executable in path
#
# Must have at least one special character (!@#\$\%^&*()_+|-=~[]{};':\",.<>?/\\)"
# Must have at least one numeric character (0 -9)'
# Must have at least one lower case alphabetic character (a - z)'
# Must have at least one upper case alphabetic character (A - Z)'
# Must have at least 14 and less than 33 characters in length'

module Spawar
  module Rad
    module Pwgen

      class Password
        attr_accessor :password

        def initialize(password)
          @password = password
        end

        def valid?
          has_special? and  has_numeric? and has_lowercase? and has_uppercase? and correct_length?
        end

        def to_s
          password
        end

        private
       
        def has_special?
          password =~ /\W/
        end

        def has_numeric?
          password =~ /\d/
        end

        def has_lowercase?
          password =~ /[a-z]/
        end

        def has_uppercase?
          password =~ /[A-Z]/
        end

        def correct_length?
          password.size >= 14 and password.size <= 33
        end

      end

    end
  end
end
