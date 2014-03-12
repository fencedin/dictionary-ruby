require './lib/term'



def main_menu

  puts "*************************************************************************"
  puts "* Commands                                                              *"
  puts "*************************************************************************"
  puts "* add [word] [definition] = to add a new word with definition           *"
  puts "* search [word] = search for term                                       *"
  puts "* mod [term] = to modify a term                                         *"
  puts "* delete [term] = delete term                                           *"
  puts "* l = list                                                              *"
  puts "* x = exit                                                              *"
  puts "*************************************************************************"

  main_choice = gets.chomp.split
  if main_choice[0] == 'add'
    main_choice.delete_at(0)
    word = main_choice[0]
    main_choice.delete_at(0)
    definition = main_choice.join(" ")
    new_term = Term.new(word, definition)
    Term.all << new_term
    system 'clear'
    puts "'#{new_term.word}' added!"
    main_menu
  elsif main_choice[0] == 'search'
    main_choice.delete_at(0)
    @search_word = main_choice.join(" ")
    search
  elsif main_choice[0] == 'mod'
    main_choice.delete_at(0)
    @mod_word = main_choice.join
    if Term.all.any? {|phrase| phrase.word == @mod_word}
      modify_term
    end
  elsif main_choice[0] == 'delete'
    main_choice.delete_at(0)
    delete_word = main_choice.join
    if Term.all.any? {|phrase| phrase.word == delete_word}
        Term.all.delete_if {|term| term.word == delete_word}
    end
    main_menu
  elsif main_choice[0] == 'l'
    system "clear"
    if Term.all.length == 0
      main_menu
    else

    Term.all.each_with_index do |obj, index|
    puts (index + 1).to_s + ". " + Term.all[index].words.join(", ") +
    ": " + Term.all[index].definitions.join(", ")
    end
    puts "\n"
    main_menu
    end
  elsif main_choice[0] == 'x'
    exit
  else
    puts "Please enter a valid command!"
    main_menu
  end
end

def modify_term
  Term.all.each do |obj|
    if @mod_word == obj.word
      puts "Hey we found '#{obj.word}'!"
      puts "Press 'a' to add a translation"
      puts "'e' to edit a definition"
      puts "Or 'd' to add another definition."
      user_choice = gets.chomp
      if user_choice == 'a'
        puts 'What translation would you like to add?'
        translation = gets.chomp
        obj.words << translation
        system "clear"
        puts "Added translation"
        main_menu
      elsif user_choice == 'd'
        puts 'What definition would you like to add?'
        def_input = gets.chomp
        obj.definitions << def_input
        system "clear"
        puts "Added def"
        main_menu
      elsif user_choice == 'e'
        puts "\nWhat definition would you to edit?"
        obj.definitions.each_with_index do |_def, index|
          puts (index + 1).to_s + ". " + obj.definitions[index]
        end
        puts "\n"
        select_input = ((gets.chomp).to_i) - 1
        puts "What would you like to change it to?"
        edit_input = gets.chomp
        obj.definitions[select_input] = edit_input
        system "clear"
        puts "#{obj.word} definition has been changed to: #{obj.definitions[select_input]}!"
        main_menu
      end
    end
  end
end

def search
  system 'clear'
  puts "Matches Found:"
  Term.search(@search_word)
  puts "\n"
  main_menu
end

def edit_def


end

system('clear')
main_menu

