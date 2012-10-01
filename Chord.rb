module MusicTheory

	class Chord

		attr_reader :name, :position, :root_note, :suffix, :notes
		
		def initialize(options = {})
			process_options(options)
		end

		def process_options(options)
			@root_note = options[:root_note] unless  options[:root_note].nil?
			@suffix = options[:suffix] unless options[:suffix].nil?
			@name = @root_note + @suffix  unless @root_note.nil? ||  @suffix.nil?
			@position = options[:position] unless options[:position].nil?

			@notes = options[:notes] unless options[:notes].nil?
		end

		def play_chord
			@notes.each do |note|
				note.play_note
			end
		end

	end

end