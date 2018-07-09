def translate(word)
    while not (word[0] =~ /[aeiouy]/)
      tmp_word = word[1..-1]
      tmp_word << word[0]
      word = tmp_word
    end
  word << "ay"
end

