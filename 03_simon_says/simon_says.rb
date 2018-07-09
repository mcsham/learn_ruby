# не знаю чи варто, але якщо це не були тести я бизе вписав захист выд дурня "if string.empty?"
def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, repeat_count = 2)
  ((string + ' ') * repeat_count).strip
end

def start_of_word(string, count_letters)
  string[0, count_letters]
end

def first_word(string)
  string.gsub(/ .*/, '')
end

def titleize (string)
  string.gsub(/^\S+|\S{5,}|\S+$/){|val| val.capitalize }
end