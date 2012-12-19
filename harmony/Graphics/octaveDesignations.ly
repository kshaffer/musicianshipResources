\version "2.14.2"

#(set-default-paper-size "letter")
#(set-global-staff-size 20)

\header {
	title = ""
	tagline = ""
	}

\paper {
	indent = 0.0\in
	top-margin = 1\in
	bottom-margin = 0.25\in
	line-width = 7.0\in
	left-margin = 0.75\in
	right-margin = 0.75\in
	ragged-right = ##t
	ragged-bottom = ##t
	ragged-last-bottom = ##t
	system-system-spacing #'minimum-distance = #25
	markup-system-spacing #'minimum-distance = #30
	last-bottom-spacing #'minimum-distance = #15
%	page-count = #3
	print-page-number = ##f
	}

global = { 
	\override Score.PaperColumn #'keep-inside-line = ##t 	
	\override Score.BarNumber #'padding = #2
	\override VoltaBracket #'extra-offset = #'(0 . -3)
	\override ChordName #'font-family = #'roman
%	\override Score.LyricText #'font-series = #'bold
%	\override Score.LyricText #'font-family = #'sans
	\override ChordName #'font-size = #0.5
	\override Staff.TimeSignature #'style = #'() 
	\set majorSevenSymbol = \markup { "maj7" }
	\override Staff.StaffGrouper #'staff-staff-spacing #'minimum-distance = #40

	% enter key signature, time signature, pickup length here
	\key c \major
	\time 8/1
%	\partial 8
	}

lower = <<
	\new Voice = "bass" <<
		\relative c' {
			\clef treble
			
		\set Staff.explicitClefVisibility = #end-of-line-invisible
   		\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
		\set Staff.printKeyCancellation = ##f
		
		c1 d e f g a b c \bar "||" \break
		
		\clef bass c,1 b a g f e d c \bar "||" \break
		
		\clef alto \time 9/1 f g a b c d e f g \bar "||"
		
			}
		
		>>
	>>

functionalBass = {
	\set stanza = \markup { \normal-text "" }
		\lyricmode {
		
		% enter functional bass here, follwing the rules of lilypond lyrics
		
		"C4" "D4" "E4" "F4" "G4" "A4" "B4" "C5"	
		"C4" "B3" "A3" "G3" "F3" "E3" "D3" "C3"
		"F3" "G3" "A3" "B3" "C4" "D4" "E4" "F4" "G4"
		}
	}

\score {
	<<
		\new Staff = "Staff_pfLower" << \global \lower >>
		\new Lyrics \lyricsto "bass" { \functionalBass }
		>>
	\layout { 
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		}
%  	\midi { }
	}
