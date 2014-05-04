require 'rspec'
require '../src/class'
require '../src/trait'

describe 'Using trait' do

  #Defino mi trait
  Trait.define do | current_trait |

    current_trait.name(:MiTrait)

    current_trait.add_method :method2 do
      "hola"
    end

  end


  #implemento sobre mi clase
  class SingleClass

    uses MiTrait

    def method1
      "munro"
    end

  end

  implement_trait = SingleClass.new

   it 'Una clase que implementa el trait tiene el mensaje del trait' do
     (SingleClass.received_message? :method2) == true
   end

  it 'Should implement object method' do
    implement_trait.method1 == "munro"
  end

end
