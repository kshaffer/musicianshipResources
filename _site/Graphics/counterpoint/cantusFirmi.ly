\version "2.14.2"

#(set-default-paper-size "letter")
#(set-global-staff-size 19)

\header {
	title = "Model cantus firmi"
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
	after-title-space = 1.5\in
	line-width = 7.0\in
	left-margin = 0.75\in
	right-margin = 0.75\in
	ragged-right = ##t
	ragged-bottom = ##t
	ragged-last-bottom = ##t
	
	system-system-spacing #'minimum-distance = #15
	markup-system-spacing #'minimum-distance = #10
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
	\time 2/2
%	\partial 8
	}

upper = \relative c'' {
	\clef treble
	<<
		{
			% enter melody here
			} \\
			
		{
			% enter middle voices (alto & tenor) here
			}
		>>
	}

lower = <<
	\new Voice = "bass" <<
		\relative c' {
			\clef alto
			
			% enter bass line here
			\override Score.RehearsalMark #'self-alignment-X = #LEFT
			\override Score.RehearsalMark #'Y-offset = #5
			\override Score.RehearsalMark #'font-size = #0
			\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
			\set Staff.printKeyCancellation = ##f

			\mark "Schenker"
			c1 d f e f g a g e d c \bar "|." \break

			\mark "Salzer & Schachter"
			c d e f g d f e d c \bar "|." \break

			\key d \major
			\mark "Salzer & Schachter"
			d g fis b a fis g fis e d \bar "|." \break

			\key f \major
			\mark "Fux"
			f g a f d e f c' a f g f \bar "|." \break
			
			\key a \major
			\mark "Salzer & Schachter"
			a, b cis fis e a, b d cis b a \bar "|." \break
			
			\key bes \major
			\mark "Salzer & Schachter"
			bes d c g' f d es d c bes \bar "|." \break \pageBreak
			
			\key c \minor
			\mark "Salzer & Schachter"
			c d f es aes g f d es d c \bar "|." \break
			
			\key d \minor
			\mark "Fux"
			d f e d g f a g f e d \bar "|." \break
			
			\key d \minor
			\mark "Jeppesen"
			d a' g f e d f e d \bar "|." \break
			
			\key g \minor
			\mark "Salzer & Schachter"
			g, d' c es d bes c bes a g \bar "|." \break
			
			\key a \minor
			\mark "Salzer & Schachter"
			a c d c d e c b a \bar "|." \break
			
			\key b \minor
			\mark "Salzer & Schachter"
			b fis a g fis d' cis b \bar "|." \break
			
			
			}
		
		>>
	>>

\score {
	\new PianoStaff \with { 
		\override StaffGrouper #'staff-staff-spacing #'minimum-distance = #10
		}
		<<
		\set PianoStaff.instrumentName = " "
		\set PianoStaff.shortInstrumentName = " "
		\set PianoStaff.midiInstrument = "piano" 
%		\new Staff = "Staff_pfUpper" << \global \upper >>
%		\new Dynamics = "Dynamics_pf" \dynamics
		\new Staff = "Staff_pfLower" << \global \lower >>
%		\new Dynamics = "pedal" \pedal	
		>>
	\layout { 
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		}
	}
