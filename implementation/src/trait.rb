require '../src/class'


class Trait

  attr_accessor :selector
  attr_accessor :metodo

  def name(name)
    Object.const_set(name, self)
  end

  def add_method method_name, &block
    @selector = method_name
    @metodo = block
  end

  def self.define(&bloque)
    bloque.call(self.new)
  end

end
