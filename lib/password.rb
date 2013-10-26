require 'password_generator'

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
