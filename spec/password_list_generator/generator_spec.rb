require_relative '../spec_helper'
require 'ostruct'

describe PasswordListGenerator::Generator do

	describe 'initialization' do
		it 'should build_characters_set' do
			config    = OpenStruct.new
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.wont_equal nil
		end

		it 'character_set should have uppercase' do
			config    = OpenStruct.new(uppercase: true)
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.find {|char| /[A-Z]/ === char}.nil?.must_equal false

			config    = OpenStruct.new(uppercase: false)
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.find {|char| /[A-Z]/ === char}.nil?.must_equal true
		end

		it 'character_set should have numeric' do
			config    = OpenStruct.new(numeric: true)
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.find {|char| /\d/ === char}.nil?.must_equal false

			config    = OpenStruct.new(numeric: false)
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.find {|char| /\d/ === char}.nil?.must_equal true
		end
		
		it 'character_set should have symbol when configured' do
			config    = OpenStruct.new(symbol: true)
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.find {|char| /\W/ === char}.nil?.must_equal false

			config    = OpenStruct.new(symbol: false)
			generator = PasswordListGenerator::Generator.new(config)
			generator.characters_set.find {|char| /\W/ === char}.nil?.must_equal true
		end

		it 'should not include ambiguous characters' do
			config    = OpenStruct.new(uppercase: true, numeric: true)
			generator = PasswordListGenerator::Generator.new(config)
			ambiguous = %w(i o 0 1 l 0 I)

			generator.characters_set.any? {|char| ambiguous.include? char}.must_equal false
		end
	end

	describe '.generate' do
		it "should generate the correct number of passwords" do
			count     = 10
			config    = OpenStruct.new(count: count, min: 5, max: 10)
			generator = PasswordListGenerator::Generator.new(config)

			generator.generate.size.must_equal count
		end

		it "should be random" do
			config           = OpenStruct.new(count: 100, min: 5, max: 10)
			invalid_password = PasswordListGenerator::Password.new("a", config)
			generator        = PasswordListGenerator::Generator.new(config)
			passwords        = generator.generate

			passwords.each do |password|
				passwords.select {|pw| pw == password}.size.must_equal 1
			end
		end

		it "should be deterministic" do
			config           = OpenStruct.new(count: 2, min: 5, max: 10)
			invalid_password = PasswordListGenerator::Password.new("a", config)
			generator        = PasswordListGenerator::Generator.new(config)

			PasswordListGenerator::Password.stub :new, invalid_password do
				begin
					passwords = generator.generate
				rescue Exception => e
					passwords.must_equal nil
				end
			end
		end
	end
end
