module MusicTheory

	class Scale

		attr_reader :name, :type, :notes

		def initialize(options = {})
			process_options(options)
		end

		def process_options(options)
			@name = options[:name].downcase
			@type = options[:type]
			@notes = parse_notes(@name, @type) 
		end

		def play
			@notes.each do |note|
				scale_note = MusicTheory::Note.new(note,5)
				scale_note.play
				sleep(0.5)
			end 
		end

		def parse_notes(name, type)
			n = ["c","c#","d","d#","e","f","f#","g","g#","a","bb","b"]
			scale_n = []

			patterns = {
				:maj => [0,2,4,5,7,9,11],
				:min => [0,1,3,5,6,8,10]
			}
			
			
			case type
			when "maj"
				whole_scale = n.rotate( idx = n.index(name) )
				
				patterns[:maj].each do |scale_note|
					scale_n.push( whole_scale[scale_note] )
				end
				scale_n.push( name )
				puts scale_n
			when "min"
				puts "minor scale"
			else
				puts "scale type not yet defined"
			end
			#return scale_notes
			#puts scale_n
			#scale_n
		end

	end

end