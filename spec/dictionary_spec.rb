require 'term'
require 'rspec'

describe 'Term' do
  before do
    Term.clear
  end

  it 'initialize the term instance' do
    test_term = Term.new('carrot', 'a veggie')
    test_term.should be_an_instance_of Term
  end

  it 'creates an empty for word and definition' do
    test_term = Term.create('carrot', 'a veggie')
    test_term.words.should eq ['carrot']
    test_term.definitions.should eq ['a veggie']
  end

  describe '.all' do
    it 'starts out as a empty array' do
      Term.all.should eq []
    end

    it 'adds a new instance to the all_terms array' do
      test_term = Term.create('carrot', 'a veggie')
      Term.all.should eq [test_term]
    end
  end

  describe '.create' do
    it 'should create a new instance of term' do
      test_term = Term.create('carrot', 'a veggie')
      test_term.should be_an_instance_of Term
    end
  end

end
