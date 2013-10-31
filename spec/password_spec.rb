require_relative 'spec_helper'

describe PasswordGenerator::Password do

  describe '.to_s' do
    before do
      @password = 'hello'
      PasswordGenerator::Password.new(@password, nil)
    end

    it { @password.to_s.must_equal @password }
  end

  describe '.valid?' do
    # context "with symbol"
    # context "when numeric"
    # context "with lowercase"
    # context "with uppercase"
    # context "with minimum length"
    # context "with maximum length"
  end

end
