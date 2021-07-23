require "./req_list"

def pwd
    system("pwd")
end

def clear
    system("clear")
end

def ls
    system("ls")
end

def init
    return Controller.new("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis gravida neque, ut pulvinar mi. Pellentesque ac rutrum justo. Aliquam lectus purus, convallis vel lacus sed, commodo feugiat orci. Phasellus vitae hendrerit massa, in varius turpis. Donec vitae erat a ipsum iaculis venenatis. Donec consectetur et ex non ultricies. Morbi at molestie purus, sed sodales nibh. Integer tincidunt feugiat justo id iaculis.\n Mauris non ex quis neque cursus efficitur finibus ut nunc. Quisque sed molestie magna. Mauris vitae sem libero. Maecenas feugiat laoreet mi sed dignissim. Aenean congue eget erat id ultrices. Quisque sollicitudin dapibus ligula, vel rutrum velit aliquet vel. Donec quis urna et purus ullamcorper gravida. Cras eget arcu eu magna porta blandit. Pellentesque tempor, nibh eu ullamcorper volutpat, risus lectus tempor sapien, sed varius mi metus vitae leo. Vestibulum ac lacus hendrerit elit scelerisque tristique ut sed tortor. Quisque diam tortor, suscipit sit amet libero sed, ultricies sollicitudin nisi. Duis ultrices eget turpis et accumsan. Donec ac iaculis risus. Cras at pretium lectus. Pellentesque congue odio sit amet libero aliquam interdum.\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur pretium ipsum non magna fermentum malesuada. Aliquam erat volutpat. Proin porttitor id sapien quis sodales. Sed aliquam justo eu efficitur sollicitudin. Curabitur a efficitur eros. Proin nec leo sapien. Vestibulum feugiat sem tortor, eu tristique dui viverra nec.\nSuspendisse et dignissim libero. Vestibulum sodales, elit sed pretium imperdiet, dui erat commodo enim, in gravida ante erat at ipsum. Donec lacus metus, pellentesque eu urna quis, ornare pellentesque diam. Sed luctus suscipit diam, eget hendrerit dolor commodo et. Praesent sit amet scelerisque dolor. Aenean feugiat posuere lorem mollis laoreet. Quisque tincidunt orci vehicula augue pretium, ac finibus tellus mollis.\nVivamus cursus vestibulum magna, accumsan bibendum orci accumsan a. Nunc luctus malesuada turpis, id lacinia dolor dictum vel. Nam vulputate venenatis velit id maximus. Quisque in vestibulum purus. Fusce luctus posuere ex nec finibus. Aliquam elementum semper ex sit amet vehicula. Integer eu dolor sed odio consectetur viverra quis at mauris. Ut non pulvinar lectus, sit amet efficitur dui. Integer eget odio lacus. Ut facilisis condimentum maximus. Curabitur sed imperdiet mi.")    
end

def delimiter
    puts "#########################################################"    
end

file = File.open("text.txt")
    file_data = file.read
    controller = Controller.new(file_data)
    delimiter
     puts "Paragraphs: #{controller.paragraph_counter}"
     delimiter
    # puts controller.paragraph
    puts "Sentences: #{controller.sentence_counter}"
    delimiter
    puts "Words: #{controller.word_counter}"
    delimiter
    puts controller.check_repetitions
file.close