module MusicTheory

	class Chord

		attr_reader :name, :position, :notes, :root_note
		
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

		def play
			@notes.each do |note|
				note.play
			end
		end

		private

		def parse_notes(name)

			n = %w{c c# d d# e f f# g g# a bb b}

			regex = {
				:root_note => /^\w{1}/,
				:chord_name =>/^\w(maj|min|sus2|sus4)/,
				:suffix => /(maj|min|sus2|sus4)/
			}

			pattern = {
				:maj => [0,4,7],
				:min => [0,3,7],
				:sus2 => [0,2,5,3],
				:sus4 => [0,5,2]
			}

			root_note = name.match(regex[:root_note]).to_s
			chord_name = name.match(regex[:chord_name]).to_s
			suffix = name.match(regex[:suffix]).to_s

			start_idx = n.index(root_note.downcase)

			@notes = retrieve_notes( n.rotate(start_idx), pattern[suffix.to_sym])

		end


		def retrieve_notes(notes, pattern)
			puts notes
			puts pattern

			

		end

	end

end