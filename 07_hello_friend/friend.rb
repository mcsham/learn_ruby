class Friend
  def greeting(name = nil)
    return 'Hello!' unless name
    "Hello, #{name}!"
  end
end
