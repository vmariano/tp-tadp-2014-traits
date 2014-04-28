require 'rspec'


#Add trait to class
class Class

  def uses(a_string)

    puts(a_string)
  end

end


 class Trait

   def name(symbol)
     puts("Symbol:", symbol)
   end
#
#   self.attr_accessor :methods_dictionary
#
   def  self.define

   end
#
#   def self.apply_methods(current_class)
#     methods_dictionary.collect { |a_method| current_class.define_method(a_method) }
#   end
end


Trait.define do

   name :MiTrait
#
#   method1 :metod1 do
#     "hola"
#   end
#
#   method :method2 do |number|
#     numero *0 + 42
#   end

end

class SingleClass

  uses MiTrait

  def method1
    "munro"
  end

end


describe 'Using trait' do

  implement_trait = SingleClass.new

  it 'Should implement object method' do
    implement_trait.method1 == "munro"
  end

  it 'Should implement a trait method' do
    ##implement_trait.method2(33) == 42
  end

end
