require_relative '../spec_helper'
require 'ostruct'

describe PasswordListGenerator::Generator do
	describe 'initialization' do
    let(:config) { OpenStruct.new(args) }
    let(:args)   { nil }

    subject { PasswordListGenerator::Generator.new(config) }

    describe 'build_character_set' do
      it { subject.characters_set.wont_equal nil }
		end

    describe 'when uppercase option' do
      describe 'when uppercase option is true' do
        let(:args) { { uppercase: true } }
        it 'should include uppercase characters' do
          subject.characters_set.any? { |char| /[A-Z]/ === char}.must_equal true
        end
      end

      describe 'is false' do
        let(:args) { { uppercase: false } }
        it 'should not include uppercase characters' do
          subject.characters_set.any? { |char| /[A-Z]/ === char }.must_equal false
        end
      end
    end

    describe 'when numeric option' do 
      describe 'is true' do 
        let(:args) { { numeric: true } }
        it 'should include numeric characters' do
          subject.characters_set.any? { |char| /\d/ === char}.must_equal true
        end
      end

      describe 'is false' do
        let(:args) { { numeric: false } }
        it 'should not include numeric characters' do
          subject.characters_set.any? { |char| /\d/ === char}.must_equal false
        end
      end
    end

    describe 'when symbol options' do
      describe 'is true' do
        let(:args) { { symbol: true } }
        it 'should include symbols' do
          subject.characters_set.any? { |char| /\W/ === char}.must_equal true
        end
      end

      describe 'is false' do
        let(:args) { { symbol: false } }
        it 'should not include symbols' do
          subject.characters_set.any? { |char| /\W/ === char }.must_equal false
        end
      end
    end

    describe 'ambiguous characters' do
      let(:args)      { { uppercase: true, numeric: true } }
      let(:ambiguous) { %w(i o 0 1 l 0 I) }

      it 'should not be use' do
        subject.characters_set.any? { |char| ambiguous.include? char}.must_equal false
      end
		end
	end

	describe '.generate' do
    let(:config) { OpenStruct.new(args) }
    let(:args)   { nil }

    subject { PasswordListGenerator::Generator.new(config).generate }

    describe 'generating passwords' do
      let(:args)  { { count: count, min: 5, max: 10 } }
      let(:count) { 10 }

      it "should generate correct number of passwords" do
        subject.size.must_equal count
      end
    end

    describe 'randomness' do
      let(:args) { { count: 100, min: 5, max: 10 } }

      it "should be random" do
        subject.must_equal subject.uniq
      end
    end

    describe 'being deterministic' do
      let(:args) { { count: 2, min: 5, max: 10 } }

      it 'raise error when necessary' do
        invalid_password = PasswordListGenerator::Password.new("a", config)

        PasswordListGenerator::Password.stub :new, invalid_password do
          begin
            passwords = subject
          rescue Exception => e
            passwords.must_equal nil
          end
        end
      end
    end
	end
end
