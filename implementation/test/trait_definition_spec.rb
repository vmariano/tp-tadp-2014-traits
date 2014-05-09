require 'rspec'
require '../src/class'
require '../src/trait'

describe 'Single trait implemented on a single class' do

  #Trait definition
  Trait.define do | current_trait |
    current_trait.name(:MyTrait)

    current_trait.add_method :method2 do
      "Hello"
    end

  end

  #Implement trait over my class
  class ASingleClass

    uses MyTrait

    def method1
      " munro"
    end

  end

  #Generate an instance
  an_object_with_a_trait = ASingleClass.new

  it 'Object should respond to the message of the trait' do
    (an_object_with_a_trait.received_message? :method2) == true
  end

end

describe 'Implement a trait with 2 messages over a class' do

  Trait.define do | current_trait |

    current_trait.name(:TraitWithTwoMethods)

    current_trait.add_method :methodA do
      "Hello"
    end

    current_trait.add_method :methodB do
      42
    end

  end

  class ASingleClass
    uses TraitWithTwoMethods

  end

  object_with_a_trait = ASingleClass.new

  it 'Object should respond to the all messages added by the traits' do
    (object_with_a_trait.received_message? :methodA) == true
    (object_with_a_trait.received_message? :methodB) == true
  end

end

describe 'Implement 2 different traits in the same class' do

  Trait.define do | current_trait |

    current_trait.name(:TraitWithTwoMethods)

    current_trait.add_method :methodA do
      "Hello"
    end

    current_trait.add_method :methodB do
      42
    end

  end

  Trait.define do | current_trait |

    current_trait.name(:TraitWithAMethod)

    current_trait.add_method :method1 do
      "Hello"
    end

  end

  class AClass
    uses TraitWithTwoMethods, TraitWithAMethod

  end

  implement_trait = AClass.new

  it 'A Object should understand all methods of different traits' do
    (implement_trait.received_message? :method1) == true
    (implement_trait.received_message? :methodA) == true
    (implement_trait.received_message? :methodB) == true
  end

end

describe 'Handling selectors names collitions' do

    Trait.define do | current_trait |

      current_trait.name(:TraitWithAMethod)

      current_trait.add_method :methodA do
        "Hello 1"
      end

    end

    Trait.define do | current_trait |

      current_trait.name(:TraitWithAMethod2)

      current_trait.add_method :methodA do
        "Hello 2"
      end

    end

  it 'Should raise exception if exist a selector name collision' do

    expect {
      class AClass
          uses TraitWithAMethod, TraitWithAMethod2
      end
    }.to raise_error(DuplicatedSelectorName)
  end

  it 'Should rise exception if class selector name collisions with a trait s selector name'  do
    expect {
      class AClass

        uses TraitWithAMethod

        def methodA
          'Hello Class'
        end
      end

    }.to raise_error(DuplicatedSelectorName)

  end

end