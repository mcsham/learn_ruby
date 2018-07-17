module NumberWord
  S = %w[zero one two three four five six seven eight nine ten].freeze
  TEENS = %w[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen].freeze
  TENS =  %w[twenty thirty forty fifty sixty seventy eighty ninety].freeze
  HUNDRED = 'hundred'.freeze
  THOUSAND = 'thousand'.freeze
  MILLION = 'million'.freeze
  TRILLON = 'trillion'.freeze
  BILLION = 'billion'.freeze
end

class Integer
  include NumberWord

  def in_words
    parse(self)

  end

  private

  def parse (num)

    return S[num] if num < 11
    return TEENS[num - 11] if num < 20 && num > 10
    result = []
    if num / 100 == 0
      result << TENS[num / 10 - 2]
      a = num % 10
      result << parse(a) unless a.zero?
    elsif num / 1000 == 0
        result << parse(num / 100)
        result << HUNDRED
        a = num % 100
        result << parse(a) unless a.zero?
    elsif num / 1000000 == 0
      result << parse(num / 1000)
      result << THOUSAND
      a = num % 1000
      result << parse(a) unless a.zero?
    elsif num / 1_000_000_000 == 0
      result << parse(num / 1_000_000)
      result << MILLION
      a = num % 1_000_000
      result << parse(a) unless a.zero?
    elsif num / 1_000_000_000_000 == 0
      result << parse(num / 1_000_000_000)
      result << BILLION
      a = num % 1_000_000_000
      result << parse(a) unless a.zero?
    elsif num / 1_000_000_000_000_000 == 0
      result << parse(num / 1_000_000_000_000)
      result << TRILLON
      a = num % 1_000_000_000_000
      result << parse(a) unless a.zero?

    end
  result.join ' '
  end

# def parse (num)
#   return S[num] if num < 11
#   return TEENS[num-11] if num < 20 && num > 10
#   result = []
#   range = 4..6
#   m_num = num.to_s
#   is_thousand = false
#   is_teens = false
#   is_million = false
#   len = m_num.length
#   m_num.each_char do |char|
#     num = char.to_i
#     is_thousand ||= true if range.include? len
#     case len
#       when 1, 4
#         if is_teens
#           result << TEENS[num-1]
#         else
#           result << S[num] unless num.zero?
#         end
#       when 2, 5
#         result << TENS[num - 2] if num > 1
#          is_teens ||= true if num == 1
#         is_thousand ||=true if len == [4..6]
#       when 3
#         result<< THOUSAND if is_thousand
#         result << S[num] << HUNDRED unless num.zero?
#       when 6..8
#         is_million ||= true
#
#     end
#   len -= 1
#   end
#   result.join ' '
# end
end
