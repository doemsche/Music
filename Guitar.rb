

require './Note.rb'
require './Chord.rb'
require './Scale.rb'

note1 = MusicTheory::Note.new("b")
note2 = MusicTheory::Note.new("E")
note3 = MusicTheory::Note.new("G")

#$chord = MusicTheory::Chord.new( :name => "Cm", :notes => [note1,note2,note3] )
$chord = MusicTheory::Chord.new( :name => "csus2" )
$c = MusicTheory::Chord.new( :notes => [note1,note2,note3] )
$scale = MusicTheory::Scale.new(:name=>"c", :type=>"maj");

