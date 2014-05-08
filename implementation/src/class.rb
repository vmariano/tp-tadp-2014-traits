class Class

  def uses(*the_traits)

    the_traits.each do | the_trait |
      the_trait.method_dictionary.each do |selector, method|
        self.define_singleton_method(selector, method)
      end
    end
  end

end
