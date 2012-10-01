module MusicTheory

  class Note
    
    attr_reader :name, :midi_id, :octave 
    
    def initialize(id, options = {})
    	case id
    	  when Integer then process_integer(id)
    	  when String then process_string(id)
    	end
    	process_options(options)
    end

    def process_integer(id)
      octave, note = *id.divmod(12)
      name = %w{c c# d d# e f f# g g# a bb b}.at(note)

      #class variables are written here
      @name = name
      @octave = octave -1
      @midi_id = id
    end

    def process_string(id)
      regex = {
        :name => /^[c,d,e,f,g,a,b]/,
        :name_accidental => /^[c#,d#,f#,g#,bb]./,
        :octave => /\d+$/
      }
      id = id.downcase

      unless id.match(regex[:octave]) == nil
        octave = id.match(regex[:octave]).to_s.to_i
      else
        octave = -1
      end

      unless id.length > 1
      	name = id.match(regex[:name]).to_s
      	puts :name
      else
      	name =id.match(regex[:name_accidental]).to_s
      end  
      
      #class variables are written here
      @name = name
      @octave = octave
      @midi_id = calculate_midi_id(@octave, @name)
    end

    def calculate_midi_id(octave, name)
      idx = ["c","c#","d","d#","e","f","f#","g","g#","a","bb"].index(name)
      id = ( ( 1 + octave ) *12 ) + idx
    end

    def process_options(options)
    	@length = options[:length]
    end

    def play_note
      puts "play this note :" +@name.to_s+ "with this MIDI no"+ @midi_id.to_s
    end
    
  end
  
end
