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

  it 'A class que implementa el trait tiene el mensaje del trait' do
    (SingleClass.received_message? :method2) == true
  end

  it 'Should implement object method' do
    implement_trait.method1 == "munro"
  end

end

describe 'Using trait with 2 methods' do

  Trait.define do | current_trait |

    current_trait.name(:TraitConDosMetodos)

    current_trait.add_method :methodA do
      "hola"
    end

    current_trait.add_method :methodB do
      42
    end

  end

  class AClass
    uses TraitConDosMetodos


  end

  object_with_two_traits = AClass.new

  it 'Una clase que implementa un trait con 2 metodos, entiende los 2' do
    (object_with_two_traits.received_message? :methodA) == true
    (object_with_two_traits.received_message? :methodB) == true
  end

end


describe 'Using trait with 3 methods' do

  Trait.define do | current_trait |

    current_trait.name(:TraitConDosMetodos)

    current_trait.add_method :methodA do
      "hola"
    end

    current_trait.add_method :methodB do
      42
    end

  end

  Trait.define do | current_trait |

    current_trait.name(:TraitConUnMetodo)

    current_trait.add_method :method1 do
      "hola"
    end

  end


  #implemento sobre mi clase
  class AClass
    uses TraitConDosMetodos, TraitConUnMetodo

  end

  implement_trait = AClass.new

  it 'Una clase que implementa 1 trait con 1 metodo, y otro trait con 2 metodos y entiende los 3 metodos' do
    (implement_trait.received_message? :method1) == true
    (implement_trait.received_message? :methodA) == true
    (implement_trait.received_message? :methodB) == true
  end

end