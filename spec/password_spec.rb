require_relative 'spec_helper'
require 'ostruct'

describe PasswordGenerator::Password do

  before { @config = OpenStruct.new }

  describe '.to_s' do
    it 'should be value initialized' do
      text     = 'hello'
      password = PasswordGenerator::Password.new(text, @config)
      password.to_s.must_equal text
    end
  end

  describe '.valid?' do
    it "should evaluate symbols" do
      text           = 'hello'
      @config.symbol = true
      @config.min    = 2
      @config.max    = 8
      password       = PasswordGenerator::Password.new(text, @config)
      password.valid?.must_equal true
    end
    # context "with symbol"
    # context "when numeric"
    # context "with lowercase"
    # context "with uppercase"
    # context "with minimum length"
    # context "with maximum length"
  end

end
