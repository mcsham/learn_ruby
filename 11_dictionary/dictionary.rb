class Dictionary
  attr_reader :entries

  def initialize
    @entries ||= {}
  end

  def add(hash)
    if hash.is_a?(Hash) # захист від дурня
      @entries.merge!(hash)
    else
      @entries[hash] ||= nil
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    @entries.assoc(key)
  end

  def find(regex)
    @entries.select { |k, _| k =~ /.*#{regex}.*/ }
  end

  def printable # імхо костиль ))
    string = ''
    @entries.sort.to_h.each_pair { |k, v| string << "[#{k}] \"#{v}\"\n" }
    string.chomp
  end
end