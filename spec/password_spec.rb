require_relative 'spec_helper'
require 'ostruct'

describe PasswordListGenerator::Password do

  before do
    @config     = OpenStruct.new
    @config.min = 2
    @config.max = 8
  end

  describe '.to_s' do
    it 'should be value initialized' do
      text     = 'hello'
      password = PasswordListGenerator::Password.new(text, @config)
      password.to_s.must_equal text
    end
  end

  describe '.valid?' do
    it "should evaluate symbols" do
      text_without = 'hello'
      text_with    = 'he###llo'

      @config.symbol      = true
      password       = PasswordListGenerator::Password.new(text_with, @config)
      password.valid?.must_equal true
      password       = PasswordListGenerator::Password.new(text_without, @config)
      password.valid?.must_equal false

      @config.symbol = false
      password       = PasswordListGenerator::Password.new(text_with, @config)
      password.valid?.must_equal true
      password       = PasswordListGenerator::Password.new(text_without, @config)
      password.valid?.must_equal true
    end

    it "should evaluate numerics" do
      text_with    = 'he8llo'
      text_without = 'hello'

      @config.numeric = true
      password        = PasswordListGenerator::Password.new(text_with, @config)
      password.valid?.must_equal true
      password        = PasswordListGenerator::Password.new(text_without, @config)
      password.valid?.must_equal false

      @config.numeric = false
      password        = PasswordListGenerator::Password.new(text_with, @config)
      password.valid?.must_equal true
      password        = PasswordListGenerator::Password.new(text_without, @config)
      password.valid?.must_equal true
    end

    it "should evaluate lowercase" do
      text_with    = 'hello'
      text_without = 'HELLO'

      password          = PasswordListGenerator::Password.new(text_with, @config)
      password.valid?.must_equal true
      password          = PasswordListGenerator::Password.new(text_without, @config)
      password.valid?.must_equal false
    end

    it "should evaluate uppercase" do
      text_with    = 'HEllo'
      text_without = 'hello'

      @config.uppercase = true
      password          = PasswordListGenerator::Password.new(text_with, @config)
      password.valid?.must_equal true
      password          = PasswordListGenerator::Password.new(text_without, @config)
      password.valid?.must_equal false

      @config.uppercase = false
      password          = PasswordListGenerator::Password.new(text_with, @config)
      password.valid?.must_equal true
      password          = PasswordListGenerator::Password.new(text_without, @config)
      password.valid?.must_equal true
    end

    it "should evaluate minimum length" do
      @config.min = 5
      below_min   = 'helo'
      equals_min  = "hello"
      exceeds_min = 'hellooo'

      password = PasswordListGenerator::Password.new(below_min, @config)
      password.valid?.must_equal false

      password = PasswordListGenerator::Password.new(equals_min, @config)
      password.valid?.must_equal true

      password = PasswordListGenerator::Password.new(exceeds_min, @config)
      password.valid?.must_equal true
    end

    it "should evaluate maximum length" do
      @config.max = 5
      below_max   = 'helo'
      equals_max  = "hello"
      exceeds_max = 'hellooo'

      password = PasswordListGenerator::Password.new(below_max , @config)
      password.valid?.must_equal true

      password = PasswordListGenerator::Password.new(equals_max , @config)
      password.valid?.must_equal true

      password = PasswordListGenerator::Password.new(exceeds_max , @config)
      password.valid?.must_equal false
    end
  end

end
