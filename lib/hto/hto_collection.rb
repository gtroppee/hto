class HtoCollection
  def initialize(collection)
    @collection = collection.map{ |item| HtoItem.new(item) }
  end

  private
    def method_missing(method_name)
      super unless @collection.respond_to?(method_name)
      @collection.send(method_name)
    end

    def respond_to_missing?(method_name, include_private = false)
      @collection.respond_to?(method_name) || super
    end
end