require 'part_of_speech'

class NounPhraseDetector
  
  ADJECTIVE = %w{JJ JJR JJS}  # adjective, advective comparative, advective superlative
  NOUN = %w{NN NNS NNP NNPS}  # noun, noun plural, proper noun, proper noun plural
  PREPOSITION = %w{TO}
  
  def initialize(text, lexicon_path)
    @words = []
    @pos = []
    analyze_part_of_speech(text, lexicon_path)
  end
  
  # Basic noun phrases pattern
  # (Adjective | Noun)* (Noun Preposition)? (Adjective | Noun)* Noun 
  def extract_all_noun_phrases
    phrases = []
    
    # We are going to start with noun on the furthest right
    # and work our way to the left
    @pos.each_with_index do |word, index|
      next unless NOUN.include?(word)
      
      phrase = [index]
      i = index
      
      until i == 0
        i -= 1
        
        if i != 0 && NOUN.include?(@pos[i]) && PREPOSITION.include?(@pos[i-1])
          phrase.unshift(i-1)
          phrase.unshift(i)
        elsif NOUN.include?(@pos[i]) || ADJECTIVE.include?(@pos[i])
          phrase.unshift(i)
        else
          break
        end
      end
      
      phrases << phrase
    end
    
    phrases.map do |x|
      x.map {|i| @words[i]}.join(' ')
    end
  end
  
  def count_noun_phrases
    noun_phrases = extract_all_noun_phrases
    phrase_counts = Hash.new {|hash,k| hash[k] = 0}
    
    noun_phrases.each do |phrase|
      phrase_counts[phrase] += 1
    end
    
    phrase_counts
  end
  
  private
    
  def analyze_part_of_speech(text, lexicon_path)    
    PartOfSpeech.analyze(lexicon_path, text).each do |analysis|
      @words << analysis[0]
      @pos << analysis[1]
    end
  end
    
end