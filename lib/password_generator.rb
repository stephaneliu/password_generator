
module spawar
  module rad
    module pwgen

      class PasswordGenerator
        attr_accessor :characters_set, :amount_to_generate

        def initialize(amount_to_generate)
          @characters_set     = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + %w(! @ # $ % ^ & * _ +)) - %w(i o O 1 l 0)
          @amount_to_generate = amount_to_generate
        end

        def generate
          passwords = []

          1.upto(amount_to_generate) do
            valid  = false
            random = ''

            until valid
              random = Password.new((1..15).map {|a| characters_set[rand(characters_set.size)]}.join)

              if random.valid?
                passwords << random
                valid = true 
              end
            end
          end

          passwords
        end
      end
    end
  end
end
