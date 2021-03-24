# frozen_string_literal: true

require 'rubygems'
require 'minitest/autorun'

# piglatin language translator
class PiglatinTranslatorTest < MiniTest::Test
  VOWELS = %w[a e i o u].freeze

  def test_pig_becomes_igpay
    assert_equal 'igpay', translate('pig')
  end

  def test_eat_becomes_eatyay
    assert_equal 'eatyay', translate('eat')
  end

  def test_string_becomes_ingstray
    assert_equal 'ingstray', translate('string')
  end

  def test_will_smile_egg_becomes_illway_ilesmay_eggyay
    assert_equal 'illway ilesmay eggyay', translate('will smile egg')
  end

  def translate(string)
    words = string.split(' ')
    new_words = words.map do |word|
      if VOWELS.include? word[0]
        "#{word}yay"
      else
        index_vowel = word.chars.index { |x| VOWELS.include? x }
        "#{word[index_vowel..-1]}#{word[0..index_vowel - 1]}ay"
      end
    end
    new_words.join(' ')
  end
end
