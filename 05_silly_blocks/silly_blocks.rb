def reverser
  # yield.split.map do |elem|
  #   elem.reverse
  # end.join(' ')
  yield.split.map(&:reverse).join(' ')
end

def adder(num = 1)
  yield + num
end

def repeater (param = 1)
  pjaram.times { yield }
end