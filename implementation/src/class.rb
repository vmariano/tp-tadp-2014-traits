class  DuplicatedSelectorName < Exception

end

class Class

  def uses(*the_traits)

    the_traits.each do | the_trait |
      the_trait.method_dictionary.each do |selector, method|

        if self.respond_to? selector
          raise DuplicatedSelectorName, 'Method was defined previusly over the class or from other trait'
        end

        self.define_singleton_method(selector, method)

      end
    end
  end
end
