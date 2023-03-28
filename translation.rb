def pig_latin(text)
  vowels = ['a', 'e', 'i', 'o', 'u']
  words = text.split(' ')
  pig_words = []
  words.each do |word|
    # Check if word begins with uppercase letter
    capital = word.match(/\A[A-Z]/) ? true : false
    # Remove non-alphabetic characters from beginning and end of word
    word = word.gsub(/^[^a-zA-Z]+|[^a-zA-Z]+$/, '')
    # Split word into alphabetic and non-alphabetic parts
    parts = word.split(/([^a-zA-Z]+)/)
    # Translate only the alphabetic part of word
    if vowels.include?(parts[0].downcase)
      pig_word = "#{parts[0]}way"
    else
      consonants = ''
      while !vowels.include?(parts[0])
        consonants += parts[0][0]
        parts[0] = parts[0][1..-1]
      end
      pig_word = "#{parts[0]}#{consonants.downcase}ay"
    end
    # Capitalize translated word if original word was capitalized
    pig_word.capitalize! if capital
    # Add non-alphabetic parts back to translated word
    parts.shift
    parts.each_slice(2) { |punct, non_alpha| pig_word += "#{punct}#{non_alpha}" }
    pig_words << pig_word
  end
  pig_text = pig_words.join(' ')
  # Capitalize first letter of Pig Latin text if original text was capitalized
  pig_text.capitalize! if text.match(/\A[A-Z]/)
  pig_text
end

# Read input from user and translate to Pig Latin
print "Enter text to translate to Pig Latin: "
input = gets.chomp
puts pig_latin(input)
