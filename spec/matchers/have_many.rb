# matchers are plain old ruby classes
class BeAHasMany

  # this is what the matcher is called on.
  # In this case: 
  #   foo.should have_many(:bars)
  # foo would be passed to the +initialize+
  def initialize(expected)
    @expected = expected
  end

  # the work horse of the class.
  # 
  # peforms the actual matching using the option +as+ method if applicable.
  def matches?(actual)    
    @actual = actual
    association_name = @as.nil? ? @expected.to_s.tableize : @as
    
    reflection = actual.reflect_on_association(association_name.to_sym)
    if reflection and reflection.macro == :has_many
      same_klass?(reflection) and same_options?(reflection)
    else
      false
    end
  end
  
  # allows you to change the name of the assocation
  # example:
  #  foo.should have_many(Bar).as(:quirks)
  def as(a)
    @as = a
    self
  end
  
  def and_options(options={})
    @options = options
    self
  end

  # error message for should
  def failure_message
    "expected #{@actual.inspect} to have_many #{@expected.inspect}, but it didn't"
  end

  # error message for should_not
  def negative_failure_message
    "expected #{@actual.inspect} not to have_many #{@expected.inspect}, but it did"
  end
  
  private
  
  def same_options?(reflection)
    (@options || { }).inject(true) do |result, pair|
      key, value = *pair
      result && reflection.options[key] == value
    end
  end
  
  def same_klass?(reflection)
    @expected == reflection.klass
  end
end

# This method is the one you use with should/should_not
def have_many(expected)
  BeAHasMany.new(expected)
end