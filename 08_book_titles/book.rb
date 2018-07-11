class Book
  WORDS = %w[the an a and of in]

  attr_reader :title

  def title=(title_book)
    @title = title_book.capitalize.split.map do |word|
      unless WORDS.include? word
        word.capitalize
      else
        word
      end
    end.join(' ')
  end

end