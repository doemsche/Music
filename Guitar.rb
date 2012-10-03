

require './Note.rb'
require './Chord.rb'

note1 = MusicTheory::Note.new("C")
note2 = MusicTheory::Note.new("E")
note3 = MusicTheory::Note.new("G")

#$chord = MusicTheory::Chord.new( :name => "Cm", :notes => [note1,note2,note3] )
$chord = MusicTheory::Chord.new( :name => "Cmaj" )

