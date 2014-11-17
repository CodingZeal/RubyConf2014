class Representer

  def initialize(options={})
    @type   = options.fetch(:type)
    @value  = options.fetch(:value)
    @parent = options.fetch(:parent, nil)
  end

  def represent
    collection.map { |item| definition_class.new(item, @parent) }
  end

  private

  def collection
    @collection ||= Array(@value)
  end

  def definition_class
    Object.const_get(class_string)
  rescue NameError
    Object.const_set(class_string, Representation)
  end

  def class_string
    @type.gsub(/s\z/,'').capitalize.gsub(/\s/, '')
  end
end