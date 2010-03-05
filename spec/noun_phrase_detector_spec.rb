require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "NounPhraseDetector" do
  before do
    @detector = NounPhraseDetector.new(test_data, lexicon_path)
  end
  
  describe "Finding a list of noun phrases" do
    it "shoud return an array" do
      @detector.extract_all_noun_phrases.should be_a(Array)
    end
  end
  
  describe "Listing the most popular noun phrases with count" do
    it "should return a hash" do
      @detector.count_noun_phrases.should be_a(Hash)
    end
  end
end
