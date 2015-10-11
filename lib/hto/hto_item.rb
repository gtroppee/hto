class HtoItem < OpenStruct
  def initialize(data)
    @hash = if data.is_a?(HashWithIndifferentAccess)
      data
    else
      HashWithIndifferentAccess.new(data)
    end
  end

  def [](key)
    collect(@hash[key])
  end

  def to_h
    @hash
  end
  alias to_hash to_h

  private
    def collect(data)
      Hto.collect(data)
    end

    def method_missing(method_name)
      super unless @hash.has_key?(method_name)
      collect(@hash[method_name])
    end

    def respond_to_missing?(method_name, include_private = false)
      @hash.has_key?(method_name) || super
    end
end