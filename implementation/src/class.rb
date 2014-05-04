class Class

  def uses(the_trait)
    self.define_singleton_method(the_trait.selector, the_trait.metodo)
  end

end
