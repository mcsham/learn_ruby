def add (a,b)
  a+b
end

def subtract(a,b)
  a-b
end

def sum (args)
  return 0 if args.empty?
  args.reduce(:+)
end

def multiply(*args)
  args.reduce(:*)
end

def power(arg1, arg2)
  arg1**arg2
end

def factorial(numb) #clasic
  return 1 if numb.zero?
  numb * factorial(numb - 1)
end

def factorial2(numb)
  numb.downto(1).reduce(:*)
end
