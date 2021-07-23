#Class wich contains most methods for text handling
class Controller
    attr_accessor :text, :paragraph, :sentence, :word

    # Class constructor, requires a text<String> parameter (can be get from a file, command or html input)
    def initialize(text)
        @text = text 
    end

    # Setter for the text parameter, just in case
    def set(text)
        @text = text
    end
    # Getter for the text parameter, just in case
    def get
        return @text
    end

    # Sets the :paragraph attribute and returns its counter
    def paragraph_counter
        # Separate pharagraphs 
        paras = @text.split(".\n", -1)
        paras.count.times do |i|
            # Removes new line characters
            paras[i] = paras[i].gsub("\n", "")
        end
        @paragraph = paras
        return @paragraph.count
    end

    # Sets the :sentence attribute and returns its counter
    def sentence_counter
        # Declare an empty hash
        sents = {}
        # Iterate each paragraph, modify question and exclamation marks
        # then fill a hash table with paragraph number as key, sentences as values
        # using , . ; : ¿ ? ¡ and ! as parameters
        @paragraph.count.times do |i|
            buffer = @paragraph[i]
            # Using | to keep marks in the sentence
            buffer = buffer.gsub("¿", "|¿")
            buffer = buffer.gsub("?", "?|")
            buffer = buffer.gsub("¡", "|¡")
            buffer = buffer.gsub("!", "!|")
            sents["p#{i}"] = buffer.split(/[,.;:|]/, -1)
        end
        counter = 0
        # sents is a hash wich contains strings arrays as values so we need to perform 2 loops
        # to iterate each string, the strip to remove any remaining space or tab character.
        sents.each do |sent|
            sent[1].count.times do |i|
                sent[1][i] = sent[1][i].strip
                #puts sent[1][i]
                counter += 1 
            end
        end
        @sentence = sents
        return counter
    end

     # Sets the :word attribute and returns its counter
    def word_counter
        words = {}
        # Iterate paragraphs, then sentences, then adds each sentence to a buffer
        @sentence.count.times do |i|
            @sentence["p#{i}"].count.times do |j|
                # Check for any empty sentence and ingnore it
                if @sentence["p#{i}"][j] != ""
                    buffer = @sentence["p#{i}"][j]
                    # Removing remaining marks
                    buffer = buffer.gsub("¡", "")
                    buffer = buffer.gsub("!", "")
                    buffer = buffer.gsub("¿", "")
                    buffer = buffer.gsub("?", "")
                    # Splits groups of words into arrays stored in hashes
                    # hashes uses paragraph an sentence pointers as keys. 
                    words["p#{i}s#{j}"] = buffer.split("\s", -1)    
                end
            end
        end
        # Counting each word
        counter = 0
        words.each do |sent|
            sent[1].each do |word|
                #puts word
                counter += 1
            end
        end
        @word = words
        return counter
    end

    # Checks each word and stores how many times those are repeated in the input text
    def check_repetitions
        word_table = {}
        @word.each do |sent|
            sent[1].each do |word|
                if word_table.has_key?(word.downcase)
                    word_table[word.downcase] += 1
                else    
                    word_table[word.downcase] = 1
                end
            end
        end
        return word_table
    end
end