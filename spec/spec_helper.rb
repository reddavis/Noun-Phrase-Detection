$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'noun_phrase_detector'
require 'spec'
require 'spec/autorun'

def test_data
  "This regular expression is read in the following manner: Zero or more adjectives or nouns, followed by an option group of a noun and a preposition, followed again by zero or more adjectives or nouns, followed by a single noun. A sequence of tags matching this pattern ensures that the corresponding words make up a noun phrase. In addition to simply pulling out the phrases, it is common to do some simple post processing to link variants together (For example, unpluralizing plural variants)."
end

def lexicon_path
  File.expand_path(File.dirname(__FILE__) + '/files/lexicon.txt')
end

Spec::Runner.configure do |config|
  
end
