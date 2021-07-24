require "./req_list"

def delimiter
     puts "############################################"   
end

file = File.open("text.txt")
    file_data = file.read
    controller = Controller.new(file_data)
file.close
    delimiter
     puts "Paragraphs: #{controller.paragraph_counter}"
     delimiter
    # puts controller.paragraph
    puts "Sentences: #{controller.sentence_counter}"
    delimiter
    puts "Words: #{controller.word_counter}"
    delimiter
    word_list = controller.check_repetitions
    word_list.each do |word|
        puts "#{word[0]}  ->  #{word[1]}"
    end