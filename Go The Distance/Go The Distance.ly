
\header {  
  title = "Go The Distance"
  subtitle = ""
  tagline = ""   
  poet = ""
  composer = ""
}

#(set-global-staff-size 20)	
\include "english.ly"

global = {
  \time 4/4
  \key c \major
}

lead = \relative c {
  \voiceTwo
  g'1~ | g2. g4 | g1~ | g2. g4 |
  c,1~ | c2. g4 | c1~ | c2.

  e8 g | a2 g | e2.  e8 g | a2 g | e2. 
  e8 g | a2 b | c4 g2 e8 d | e2~ e8 f e4 | d2.

  \bar "|."
}

leadWords = \lyricmode {
  Do do do do | do do do 
  I have oft -- en dreamed of a far off place
  Where a great warm wel -- come would be wait -- ing for me
  Where the crowds will cheer when they see my face
  And a voice keeps say -- ing this is where I'm meant to be

  I will find my way I can go the dis -- tance
  I'll be there some -- day if I can be strong
  I know eve -- ry mile will be worth my while
  When I go the dis -- tance I'll be right where I be -- long

Belong
where I belong

Down in unknown ?
to embrace my fate
Know that road may wander it will lead me to you
in a thousand years will be worth the wai
it may take a lifetime but somehow I'll see it through


xx I can go the distance
xx if I can be strong
I know every mile will be worth my while
When I go the distance I'll be right where I belong

But you lok beyond the glory is the hardest part
for a hero's strneght is measured by his heart

Please lord, I will beat the odds
I can go the distance
I will face the world
fearles proud and strong
I will please my god, I can go the distance
till I find my heore's welcome right where I belong

}


tenor = \relative c {
  \voiceOne
  s1 s s s |
  s s s s |

  c'2 b | c1 | c2 b | c1 |
  c2 d | e1 | c1 | b |
}


bass = \relative c {
  \voiceTwo
  g'1~ | g2. g4 | g1~ | g2. g4 |
  c,1~ | c2. g4 | c1~ | c1 |

  f,2 g | c1 | f,2 g | c1 |
  f,2 g | a1 | f | g |

} 

baritone = \relative c {
  \voiceOne
}

\score { 
  \transpose c c \context StaffGroup <<
    #(set-accidental-style 'modern-voice-cautionary 'Score)
    \context Staff = "upper" <<
      \clef "treble_8"
      \context Voice = "tenor" \with {
        \consists "Ambitus_engraver"
      } <<
        \global
        \override Ambitus #'X-offset = #2.0
        \tenor
      >>
      \context Voice = "lead" \with {
        \consists "Ambitus_engraver"
      } << \global \lead >>
    >>
    \new Lyrics = "leadLyrics" { s }
    \context Staff = "lower" <<
      \clef bass
      \context Voice = "baritone" \with {
        \consists "Ambitus_engraver"
      } <<
        \global
        \override Ambitus #'X-offset = #2.0
        \baritone
      >>
      \context Voice = "bass" \with {
        \consists "Ambitus_engraver"
      } << \global \bass >>
    >>
    \context Lyrics = "leadLyrics" \lyricsto "lead" \leadWords
  >>
  \layout {
    \context {
      \Lyrics
      \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((padding . 1.2))
    }
    \context {
      \StaffGroup
      \remove "Span_bar_engraver"
    }
    \context {
      \Staff
     \override VerticalAxisGroup #'staff-staff-spacing = #'((padding . 0))
      autoBeaming = ##t
      \unset melismaBusyProperties 
    }
    \context {
      \Score
      % barNumberVisibility = #(lambda (barnum) #f)
    }
  }  
  \midi { }
}
\paper {
  line-width = 6\in 
  indent = 0
}

