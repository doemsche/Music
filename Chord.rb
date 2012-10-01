module MusicTheory

	class Chord

		attr_reader :name, :position, :notes
		
		def initialize(options = {})
			process_options(options)
		end

		def process_options(options)
			@name = options[:name]
			@position = options[:position] unless options[:position].nil?

			if options[:notes].nil? and options[:name]
				parse_notes(options[:name])
			else
				@notes = options[:notes] unless options[:notes].nil?
			end
		end

		def play_chord
			@notes.each do |note|
				note.play_note
			end
		end

		private

		def parse_notes(name)
			
			regex = {
				:root_note => /^\w{1}/,
				:chord_name =>/^\w(maj|min|sus2|sus4)/,
				:suffix => /(maj|min|sus2|sus4)/
			}

			root_note = name.match(regex[:root_note]).to_s
			chord_name = name.match(regex[:chord_name]).to_s
			suffix = name.match(regex[:suffix]).to_s

			@name = chord_name
		end
	end

end