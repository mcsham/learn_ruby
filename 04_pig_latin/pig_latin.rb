def translate(text) # спаси и сохрани, аминь (Индус стайл)
  text.split.map do |word|
    until (word[0] =~ /[aeioy]/)
      char = word[0]
      word[0] = ''
      word << char
    end
    word << "ay"
  end.join(' ')
end

def translate2(text) # спаси и сохрани, аминь (Индус стайл)
  text.split(' ').map do |word|
      until (word[0] =~ /[aeioy]/)
        char = word[0]
        word[0] = ''
        word << char
      end
    word << "ay"
    end.join(' ')
end

