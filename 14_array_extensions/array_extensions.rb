class Array

  def square
    self.map { |arg| arg*arg }
  end

  def square!
    self.map! { |arg| arg*arg }
  end

end

