require '../src/class'


class Trait

  attr_accessor :method_dictionary

  def initialize
    @method_dictionary = Hash.new
  end

  def name(name)
    Object.const_set(name, self)
  end

  def add_method method_name, &block
    @method_dictionary.store(method_name, block)
  end

  def self.define(&bloque)
    bloque.call(self.new)
  end

end
