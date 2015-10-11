class Hto < OpenStruct
  def self.collect(data)
    if is_hash?(data)
      HtoItem.new(data)
    elsif is_array_of_hashes?(data)
      HtoCollection.new(data)
    else
      data
    end
  end

  private
    def self.is_hash?(data)
      data.is_a?(Hash)
    end

    def self.is_array_of_hashes?(data)
      data.is_a?(Array) && data.first.is_a?(Hash)
    end
end