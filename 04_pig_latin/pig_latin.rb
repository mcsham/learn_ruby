def translate(text) # спаси и сохрани, аминь (Индус стайл)
  text.split(' ').map do |word|
    unless word.empty?
      until (word[0] =~ /[aeioy]/)
        p word
        char = word[0]
        word[0] = ''
        word << char
      end
    word << "ay"
    end
    end.join(' ')
end

