\version "2.14.2"

#(set-default-paper-size "letter")
#(set-global-staff-size 20)

\header {
	title = ""
	subtitle = ""
	poet = ""
	composer = ""
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
	line-width = 7.0\in
	left-margin = 0.75\in
	right-margin = 0.75\in
	ragged-right = ##t
	ragged-bottom = ##f
	ragged-last-bottom = ##t
	system-system-spacing #'minimum-distance = #25
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

	% enter key signature, time signature, pickup length here
	\key c \major
	\time 2/2
%	\partial 8
	}

upper = \relative c' {
	\clef treble
    <e g c>1 <e a c> <f a c> <e g b> <e g a> <e f a> <d f a>
    <e g c>1 <e a c> <f a c> <e g b> <e g a> <e f a> <d f a>
    \key c \minor
    <g b d> <d g d'> <g b d> <g b d>
	}

lower = <<
	\new Voice = "bass" <<
		\relative c' {
			\clef bass
			
			% enter bass line here
			c1 c c \bar "||" c c c c \bar "||" \break
			c1 c c \bar "||" c c c c \bar "||" \break
            \key c \minor
            g,1 b d f \bar "||"
			}
		
		\new FiguredBass \figuremode {
			\override BassFigure #'extra-offset = #'(0 . 12)
			
			% enter figures here within <> brackets
				% use + for sharp, - for flat, ! for natural
				% _ will make accidental by itself (apply to 3)
				% use s if bass note has no figure
				
                <5 3>1 <6 3> <6 4> <7 5 3> <6 5 3> <6 4 3> <6 4 2>
                s1 <6> <6 4> <7> <6 5> <4 3> <4 2>
                <_!> <6> <6/ 4> <4/ 2>
        
			}
		>>
	>>

functionalBass = {
	\set stanza = \markup { \normal-text "" }
		\lyricmode {
		
		% enter functional bass here, follwing the rules of lilypond lyrics
		
		"D5" \skip2 "T1"	
		"D5" \skip2 "T1"	
		"D5" \skip2 "T1"	
		"D5" \skip2 "T1"	
		"D5" \skip2 "T1"	
		"D5" "T1"	
		}
	}

dynamics = {
	s1\p
	}

pedal = {
	s2\sustainOn
	s\sustainOff
	}

\score {
	\new PianoStaff \with { 
		\override StaffGrouper #'staff-staff-spacing #'minimum-distance = #15
		}
		<<
		\set PianoStaff.instrumentName = " "
		\set PianoStaff.shortInstrumentName = " "
		\set PianoStaff.midiInstrument = "piano" 
		\new Staff = "Staff_pfUpper" << \global \upper >>
%		\new Dynamics = "Dynamics_pf" \dynamics
		\new Staff = "Staff_pfLower" << \global \lower >>
%		\new Lyrics \lyricsto "bass" { \functionalBass }
%		\new Dynamics = "pedal" \pedal	
		>>
	\layout { 
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		}
	}
