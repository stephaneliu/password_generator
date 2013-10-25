# This script requires ruby executable in path
#
# Must have at least one special character (!@#\$\%^&*()_+|-=~[]{};':\",.<>?/\\)"
# Must have at least one numeric character (0 -9)'
# Must have at least one lower case alphabetic character (a - z)'
# Must have at least one upper case alphabetic character (A - Z)'
# Must have at least 14 and less than 33 characters in length'

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

input_valid = false

until input_valid
  puts "How many passwords to generate? [100] "

  answer      = gets.chomp
  count       = answer.to_i
  input_valid = true if count > 0
end

pw_gen    = PasswordGenerator.new(count)
passwords = pw_gen.generate

system "echo ' ' > ./password.txt \n\n"
system "echo 'Generated passwords meet the following requirements: ' >> ./password.txt"
system "echo 'Must have at least one special character (!@#\$\%^&*())' >> ./password.txt"
system "echo 'Must have at least one numeric character (0 -9)' >> ./password.txt"
system "echo 'Must have at least one lower case alphabetic character (a - z)' >> ./password.txt"
system "echo 'Must have at least one upper case alphabetic character (A - Z)' >> ./password.txt"
system "echo 'Must have at least 14 and less than 33 characters in length' >> ./password.txt"
system "echo ' ' >> ./password.txt \n\n"
system "echo '" + passwords.map(&:to_s).join("\n\n") + "' >> ./password.txt"
puts "Ok, generated #{count} random passwords into password.txt"
