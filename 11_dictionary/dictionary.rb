class Dictionary
  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(hash)
    if hash.is_a?(Hash) # захист від дурня
      @entries.merge!(hash)
    else
      @entries[hash] = nil
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

  def printable
    @entries.sort.reduce('') do |result, val|
      result << "[#{val[0]}] \"#{val[1]}\"\n"
    end.chomp
  end
end