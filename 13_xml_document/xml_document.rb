class XmlDocument
  @level = 0
  def initialize(enter = false)
    @set_enters = enter
    @level = 0
  end

  def method_missing(symbol, *args)
    @level += 1
    values ||= {}
    name = symbol.id2name
    values[name] = if args.empty?
                     block_given? ? yield : nil
                   else
                     args[0]
                   end

    result = hash2str(values)
    @level -= 1
    result
  end

  private

  def hash2str(hash)
    e = "\n" if @set_enters
    b = ''
    b = '  ' if @set_enters
    hash.each_pair do |key, val|
      return "#{b * (@level - 1)}<#{key}/>#{e}" unless val
      if val.class == Hash
        val.each_pair do |sub_key, sub_val|
          return "#{b * (@level - 1)}<#{key} "\
                    "#{sub_key}='#{sub_val}'/>"\
                    "#{e}"
        end
      else
        return "#{b * (@level - 1)}<#{key}>#{e}"\
                    "#{val}"\
                "#{b * (@level - 1)}</#{key}>#{e}"
      end
    end
  end
end
