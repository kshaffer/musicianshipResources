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
	between-title-space = 0.5\in
	after-title-space = 1.05\in
	line-width = 7.0\in
	left-margin = 0.75\in
	right-margin = 0.75\in
	ragged-right = ##f
	ragged-bottom = ##f
	ragged-last-bottom = ##t
	system-system-spacing #'minimum-distance = #20
	markup-system-spacing #'minimum-distance = #10
	last-bottom-spacing #'minimum-distance = #15
%	page-count = #3
	print-page-number = ##f

	myStaffSize = #18
	#(define fonts
   (make-pango-font-tree  "Fanwood"
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
%	\override Score.LyricText #'font-family = #'sans
	\override ChordName #'font-size = #0.5
	\override Staff.TimeSignature #'style = #'() 
	\set majorSevenSymbol = \markup { "maj7" }

	\set Staff.printKeyCancellation = ##f 
	\override Staff.TimeSignature #'break-visibility = #end-of-line-invisible
	\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
	\set Staff.explicitClefVisibility = #end-of-line-invisible	

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
            c2 d c b c b c1 \bar "|."
        } \\
			
		{
			% enter middle voices (alto & tenor) here
            <e, g>2 <d g> <d fis> <d g> <d a'> <d g> <e g>1
        }
		>>
	}

lower = <<
	\new Voice = "bass" <<
		\relative c' {
			\clef bass
			
			% enter bass line here
            c2 b a g f g c,1
        }
		
		\new FiguredBass \figuremode {
			\override BassFigure #'extra-offset = #'(0 . 12)
			
			% enter figures here within <> brackets
				% use + for sharp, - for flat, ! for natural
				% _ will make accidental by itself (apply to 3)
				% use s if bass note has no figure
                s2 <6> <6/ 4 3> s <6 5> s s1
			}
		>>
	>>

functionalBass = {
	\set stanza = \markup { \normal-text "C:" }
		\lyricmode {
		
		% enter functional bass here, follwing the rules of lilypond lyrics
        "T1" "D7p" "[S6]" "D(5" "S4n" "5)" "T1"
    }
	}

functionalBassLower = {
	\set stanza = \markup { \normal-text "" }
		\lyricmode {
		
		% enter functional bass here, follwing the rules of lilypond lyrics
        \skip2 \skip2 "D2/V"
    }
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
		\new Staff = "Staff_pfLower" << \global \lower >>
		\new Lyrics \lyricsto "bass" { \functionalBass }
    	\new Lyrics \lyricsto "bass" { \functionalBassLower }
		>>
	\layout { 
		\context { \Score \remove "Bar_number_engraver" }
    }
	}
