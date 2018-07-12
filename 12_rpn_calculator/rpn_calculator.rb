class RPNCalculator
  attr_reader :value

  def initialize
    @elem ||= []
    @value ||= 0
  end

  def push(val)
    @elem << val
  end

  def plus
    @elem << @value = operation { |arg1, arg2| arg1 + arg2.to_i }
  end

  def minus
    @elem << @value = operation { |arg1, arg2| arg2 - arg1 }
  end

  def divide
    @elem << @value = operation { |arg1, arg2| arg2 / arg1.to_f }
  end

  def times
    @elem << @value = operation {|arg1, arg2| arg1 * arg2}
  end

  def tokens(string)
    string.split.map do|elem|
      if elem =~ /[+\-*\/]/
        elem.to_sym
      else
        elem.to_i
      end
    end
  end

  def evaluate(string)
    string.split.map do|elem|
      if elem =~ /[+\-*\/]/
        case elem
          when '+'
            plus
          when '-'
            minus
          when '*'
            times
          when '/'
            divide
        end
      else
        @elem << elem.to_i
      end
    end
    @value
  end

  private

  def operation
    raise "calculator is empty" if @elem.empty?
    yield(@elem.pop, @elem.pop)
  end
end
