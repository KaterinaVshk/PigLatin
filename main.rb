require "rubygems"
require "minitest/autorun"

class PiglatinTranslatorTest < MiniTest::Test
    VOWELS = ['a','e','i','o','u']

    def test_pig_becomes_igpay
        assert_equal "igpay", translate("pig")
    end

    def test_eat_becomes_eatyay
        assert_equal "eatyay", translate("eat")
    end

    def test_string_becomes_ingstray
        assert_equal "ingstray", translate("string")
    end

    def test_will_smile_egg_becomes_illway_ilesmay_eggyay
        assert_equal "illway ilesmay eggyay", translate_sentence("will smile egg")
    end

    def translate_sentence(string)
        words = string.split(" ")
        new_words = words.map {|word| translate(word)}
        new_words.join(" ")
    end

    private
    def translate(word)
        if VOWELS.include? word[0]
            word + "yay"
        else
            index_vowel = word.chars.index {|x| VOWELS.include? x}
            word[index_vowel..-1]+ word[0..index_vowel-1]+"ay"
        end 
    end
end