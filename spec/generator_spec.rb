require_relative 'spec_helper'
require 'ostruct'

describe PasswordListGenerator::Generator do

	describe "initialization" do
		it "should build_characters_set" do
			config    = OpenStruct.new
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.wont_equal nil
		end

		it 'character_set should have uppercase' do
			config    = OpenStruct.new(uppercase: true)
			generator = PasswordListGenerator::Generator.new(config)

			generator.characters_set.find {|char| /[A-Z]/ === char}.nil?.wont_equal nil
		end

		it 'character_set should have numeric' do
			config    = OpenStruct.new(numeric: true)
			generator = PasswordListGenerator::Generator.new(config)

			generator.characters_set.find {|char| /\d/ === char}.nil?.wont_equal nil
		end
		
		it 'character_set should have symbol' do
			config    = OpenStruct.new(symbol: true)
			generator = PasswordListGenerator::Generator.new(config)

			generator.characters_set.find {|char| /\W/ === char}.nil?.wont_equal nil
		end

		it 'should not include ambiguous characters' do
			config    = OpenStruct.new(uppercase: true, numeric: true)
			generator = PasswordListGenerator::Generator.new(config)
			ambiguous = %w(i o 0 1 l 0 I)

			generator.characters_set.any? {|char| ambiguous.include? char}.must_equal false
		end
	end
end
