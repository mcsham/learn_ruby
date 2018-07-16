class XmlDocument
  @level = 0
  def initialize(enter = false)
    @set_enters = enter
    @level = 0
  end

  def method_missing(symbol, *args, &block)
    @level+=1
    values ||= {}
    name = symbol.id2name
    unless args.empty?
      values[name] = args[0]
    else
      values[name] = (block_given?)? yield : nil
    end

    r= hash2str(values)
    @level = @level.pred
    r
  end

  private

  def hash2str(hash)

    e = "\n" if @set_enters
    b = ''
    b = '  ' if @set_enters
    hash.each_pair do |k, v|
      return "#{b*(@level-1)}<#{k}/>#{e}" unless v
      if v.class == Hash
        v.each_pair do |k1, v1|
          return "#{b*(@level-1)}<#{k} #{k1}='#{v1}'/>#{e}"
        end
      else
        return "#{b*(@level-1)}<#{k}>#{e}#{v}#{b*(@level-1)}</#{k}>#{e}"
      end
    end
  end

end
