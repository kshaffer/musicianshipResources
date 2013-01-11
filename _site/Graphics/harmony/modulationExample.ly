\version "2.14.2"

#(set-default-paper-size "letter")
#(set-global-staff-size 18)

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
	top-margin = 0.75\in
	bottom-margin = 0.25\in
	page-top-space = 0\in
	before-title-space = 0\in
	between-title-space = 1.5\in
	after-title-space = 1.05\in
	line-width = 7.0\in
	left-margin = 0.75\in
	right-margin = 0.75\in
	ragged-right = ##t
	ragged-bottom = ##t
	ragged-last-bottom = ##t
	system-system-spacing #'minimum-distance = #25
	markup-system-spacing #'minimum-distance = #18
	last-bottom-spacing #'minimum-distance = #15
%	page-count = #1
	print-page-number = ##f

	myStaffSize = #18
	#(define fonts
   (make-pango-font-tree "Fanwood"
                          "Nimbus Sans"
                          "Luxi Mono"
;;                        "Helvetica"
;;                        "Courier"
     (/ myStaffSize 18)))
	}

global = { 
	\override Score.PaperColumn #'keep-inside-line = ##t 	
	\override Score.BarNumber #'padding = #2
	\override VoltaBracket #'extra-offset = #'(0 . -3)
	\override ChordName #'font-family = #'roman
%	\override Score.LyricText #'font-series = #'bold
	\override Score.LyricText #'font-family = #'sans
	\override ChordName #'font-size = #0.5
	\override Staff.TimeSignature #'style = #'() 
	\set majorSevenSymbol = \markup { "maj7" }
	\override Staff.StaffGrouper #'staff-staff-spacing #'minimum-distance = #40

	\override Staff.KeyCancellation #'break-visibility = #all-invisible
	\override Staff.TimeSignature #'break-visibility = #end-of-line-invisible
	\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
	\set Staff.explicitClefVisibility = #end-of-line-invisible	

%	\override Staff.TimeSignature #'stencil = ##f
%	\override Score.BarLine #'stencil = ##f	
	
	% enter key signature, time signature, pickup length here
	\key f \major
	\time 2/2
%	\partial 8
	}

lower = <<
	\new Voice = "bass" <<
		\relative c {
			\clef bass
			
			% enter bass line here
			\override Score.RehearsalMark #'extra-offset = #'(3 . 5)

			f2 e d g c,1 \bar "|."
			}
		
		\new FiguredBass \figuremode {
			\override BassFigure #'extra-offset = #'(0 . 12)
			
			% enter figures here within <> brackets
				% use + for sharp, - for flat, ! for natural
				% _ will make accidental by itself (apply to 3)
				% use s if bass note has no figure
			
			s2 <6> s <7 _+> s1
			
			}
		>>
	>>

functionalBass = {
	\set stanza = \markup { \normal-text "" }
		\lyricmode {
		
		% enter functional bass here, with each symbol inside parentheses
		% for example:
		% "T(1" "D2p" "3)" "S4" "D5" "T1"
		%
		% to show a functional bass continuing from chord to chord, use "—"
		% (i.e., in a compound cadence: "D5" "—" "T1")
		
		"F: T(1" "D7p" "x6)"
		
		}
	}

functionalBassLower = {
	\set stanza = \markup { \normal-text "" }
		\lyricmode {
		
		% enter functional bass here, with each symbol inside parentheses
		% for example:
		% "T(1" "D2p" "3)" "S4" "D5" "T1"
		%
		% to show a functional bass continuing from chord to chord, use "—"
		% (i.e., in a compound cadence: "D5" "—" "T1")
		
		\skip2 \skip2 "C: S2" "D5" "T1"
		
		}
	}

\score {
	\new PianoStaff \with { 
		\override StaffGrouper #'staff-staff-spacing #'minimum-distance = #15
		}
		<<
		\new Staff = "Staff_pfLower" << \global \lower >>
		\new Lyrics \lyricsto "bass" { \functionalBass }
		\new Lyrics \lyricsto "bass" { \functionalBassLower }
		>>
	\layout { 
		\context { \Score \remove "Bar_number_engraver" } 
		\context { \Score \remove "Time_signature_engraver" } 
		}
%  	\midi { }
	}
