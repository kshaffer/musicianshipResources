\version "2.14.2"

#(set-default-paper-size "letter")
#(set-global-staff-size 20)

\header {
	title = ""
	subtitle = ""
	poet = ""
%	composer = \markup { \column { \line { "Name _________________________" } \line { " " } \line { " " } } }
	tagline = ""
	copyright = ""
	}

\paper {
	indent = 0.0\in
	top-margin = 0.5\in
	bottom-margin = 0.25\in
	page-top-space = 0\in
	before-title-space = 0\in
	between-title-space = 1.5\in
	after-title-space = 1.05\in
	line-width = 2.0\in
	left-margin = 0.75\in
	right-margin = 5.75\in
	ragged-right = ##f
	ragged-bottom = ##f
	ragged-last-bottom = ##f
	system-system-spacing #'minimum-distance = #17
	markup-system-spacing #'minimum-distance = #18
	last-bottom-spacing #'minimum-distance = #15
%	page-count = #3
	print-page-number = ##f
	}

global = { 
	\override Score.PaperColumn #'keep-inside-line = ##t 	
	\override Score.BarNumber #'padding = #2
	\override VoltaBracket #'extra-offset = #'(0 . -3)
	\override ChordName #'font-family = #'roman
	\override Score.LyricText #'font-series = #'bold
	\override Score.LyricText #'font-family = #'sans
	\override ChordName #'font-size = #0.5
	\override Staff.TimeSignature #'style = #'() 
	\set majorSevenSymbol = \markup { "maj7" }
	\override Staff.StaffGrouper #'staff-staff-spacing #'minimum-distance = #40

	\override Staff.KeyCancellation #'break-visibility = #all-invisible
	\override Staff.TimeSignature #'break-visibility = #end-of-line-invisible
	\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
	\set Staff.explicitClefVisibility = #end-of-line-invisible	

	% enter key signature, time signature, pickup length here
%	\partial 8
	}

lower = <<
	\new Voice = "bass" <<
		\relative c' {
			\override Score.RehearsalMark #'self-alignment-X = #LEFT
			\override Score.RehearsalMark #'Y-offset = #10
			\override Score.RehearsalMark #'font-size = #0
			\override Staff.StaffSymbol #'line-count = #1
			\startStaff
			\clef percussion
			\mark \markup { \column { \line { "For each rhythmic line below, provide the corresponding protonotation." }
				\line { " " } } }
			\key c \major
			\override Staff.BarLine #'bar-extent = #'(-1.5 . 1.5)
			\time 4/4
			c4 c c c \break c8 c4 c8~ c c4 r8 \break
			
			c2 c c c \break c4 c2 c4~ c c2 r4 \break
			
			c8 c c c c c c c \break c16 c8 c16~ c16 c8 c16~ c16 c8 c16~ c16 c8 r16 \break
			
			
			}
				>>
	>>

\score {
	\new PianoStaff \with { 
		\override StaffGrouper #'staff-staff-spacing #'minimum-distance = #15
		}
		<<
		\new Staff = "Staff_pfLower" << \global \lower >>
		>>
	\layout { 
		\context { \Score \remove "Bar_number_engraver" }
%		\context { \Staff \remove "Time_signature_engraver" }
		}
%  	\midi { }
	}
