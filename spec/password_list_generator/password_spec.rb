require_relative '../spec_helper'
require 'ostruct'

describe PasswordListGenerator::Password do
  subject { PasswordListGenerator::Password.new(text, config) }

  let(:config)       { OpenStruct.new(default_args) }
  let(:default_args) { { min: 2, max: 8 }.merge(args) }
  let(:args)         { { _does_not_matter: true } }

	describe '.new' do
    let(:text) { 'test' }

		it 'should initialize password and config variables' do
			subject.password.must_equal text
			subject.config.must_equal config
		end
	end

  describe '.to_s' do
    let(:text) { 'hello' }
    it         { subject.to_s.must_equal text }
  end

  describe '.valid?' do
    describe 'validating symbols' do
      let(:text_without_symbol) { 'hello' }
      let(:text_with_symbol)    { 'he###llo' }

      describe 'when symbol configuration is true' do
        let(:args) { { symbol: true } }

        describe 'and text does not have symbol' do
          let(:text) { text_without_symbol }
          it         { subject.valid?.must_equal false }
        end

        describe 'and text has symbol' do
          let(:text) { text_with_symbol }
          it         { subject.valid?.must_equal true }
        end
      end

      describe 'when symbol configuration is false' do
        let(:args) { { symbol: false } }

        describe 'and text does not have symbol' do
          let(:text) { text_without_symbol }
          it         { subject.valid?.must_equal true }
        end

        describe 'text has symbol' do
          let(:text) { text_with_symbol }
          it         { subject.valid?.must_equal true }
        end
      end
    end

    describe 'validating numericality' do
      let(:text_with_numeric)    { 'he8llo' }
      let(:text_without_numeric) { 'hello' }

      describe 'when numeric configuration is true' do
        let(:args) { { numeric: true } }

        describe 'and text does not have numeric' do
          let(:text) { text_without_numeric }
          it         { subject.valid?.must_equal false }
        end
      end

      describe 'when numeric configuration is false' do
        describe 'and text have numeric' do
          let(:text) { text_with_numeric }
          it         { subject.valid?.must_equal true }
        end
      end
    end

    describe 'evaluating lowercase' do
      let(:text_with_lowercase)    { 'hello' }
      let(:text_without_lowercase) { 'HELLO' }

      describe 'when text has lowercase' do
        let(:text) { text_with_lowercase }
        it         { subject.valid?.must_equal true }
      end
    end

    describe 'evaluating uppercase' do
      let(:text_with_uppercase) { 'HEllo' }
      let(:text_without_uppercase) { 'hello' }

      describe 'when uppercase configuration is true' do
        let(:args) { { uppercase: true } }

        describe 'and text has uppercase' do
          let(:text) { text_with_uppercase }
          it         { subject.valid?.must_equal true }
        end

        describe 'and text does not have uppercase' do
          let(:text) { text_without_uppercase }
          it         { subject.valid?.must_equal false }
        end
      end

      describe 'when uppercase configuration is false' do
        let(:args) { { uppercase: false } }

        describe 'and text has uppercase' do
          let(:text) { text_with_uppercase }
          it         { subject.valid?.must_equal true }
        end

        describe 'and text does not have uppercase' do
          let(:text) { text_without_uppercase }
          it         { subject.valid?.must_equal true }
        end
      end
    end

    describe 'evaluating minimum length' do
      describe 'when min configuration is 5' do
        let(:args) { { min: 5 } }

        describe 'when text is below min' do
          let(:text) { 'helo' }
          it         { subject.valid?.must_equal false }
        end

        describe 'when text is equal to min' do
          let(:text) { "hello" }
          it         { subject.valid?.must_equal true }
        end

        describe 'when text is greater than min' do
          let(:text) { 'hellooo' }
          it         { subject.valid?.must_equal true }
        end
      end
    end

    describe 'evaluating maximum length' do
      describe 'when max configuration is 5' do
        let(:args) { { max: 5 } }

        describe 'when text is below max' do
          let(:text) { 'helo' }
          it         { subject.valid?.must_equal true }
        end

        describe 'when text is equal to max' do
          let(:text) { "hello" }
          it         { subject.valid?.must_equal true }
        end

        describe 'when text is greater than max' do
          let(:text) { 'hellooo' }
          it         { subject.valid?.must_equal false }
        end
      end
    end
  end
end
