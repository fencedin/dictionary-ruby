class Term
  attr_reader :word, :words, :definitions
  @@all_terms = []

  def initialize(word, definitions)
    @word = word
    # @definition = definition
    @words = []
    @definitions = []
    @words << word
    @definitions << definitions
  end

  def Term.clear
    @@all_terms = []
  end

  def Term.create(word, definitions)
    test_term = Term.new(word, definitions)
    @@all_terms << test_term
    test_term
  end

  def Term.all
    @@all_terms
  end

end



