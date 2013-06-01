
\header {  
  title = "When I Leave The World Behind"
  subtitle = ""
  tagline = ""   
  poet = ""
  composer = ""
}

#(set-global-staff-size 20)	
\include "english.ly"

lead = 
\relative a {
  \time 4/4
  \voiceTwo
  \partial 8*3
  bf8 c d ef4 bf b \glissando f'8 
  b, | 
  \cadenzaOn
  f'4 ef c \glissando ef~ ef2 
  ef8
  \cadenzaOff \bar "|"
  ef4 ef8 c ef d
  
  bf4 | ef1~ | ef1~ | ef1~ | ef1
  ef2 f2~ | f1~ | f1 \glissando | ef1~ | ef1~ | ef1
  \bar "|."
}

leadWords = \lyricmode { 
  I leave the moon a -- bove _
  To those in love __ _
  when I leave the world __ _

  be -- hind __ the world __ _
}


tenor =  
\relative a {
  \voiceOne
  \partial 8*3
  af'8 af af g4 g g \glissando b8 
  f | 
  \cadenzaOn
  af4 af af \glissando c c b 
  b8
  \cadenzaOff \bar "|"
  bf4 bf8 a af2

  | r1 | g4 af bf g | f g af af | g1~
  g1 | r2 g2 | cf1~ | cf1~ | cf2 cf2 | bf1
}


bass = 	
\relative a {
  \time 4/4
  \voiceTwo
  \partial 8*3
  f8 f e ef4 ef d \glissando d'8 
  g, | 
  \cadenzaOn
  d4 af' af1 
  af8
  \cadenzaOff
  ef4 g8 gf f2

  | r1 | bf4 af g bf | af g f e | ef1~ | ef1
  r2 ef2 | af1~ | af1~ | af2 af2 | ef1
  
} 

baritone =   
\relative c {
  \voiceOne
  \partial 8*3
  d'8 d b bf4 ef f \glissando g8
  d |
  \cadenzaOn
  b4 c ef \glissando af g f
  gf8
  \cadenzaOff \bar "|"
  g4 c,8 ef c8 bf4.

  | r1 | df4 df df df | c2 cf4 cf | bf1~ | bf1
  r2 bf2 | ef1 \glissando | f1 | f2 fs2 | g1
}

baritoneWords = \lyricmode { 
  _ _ _ _ _ _ _ _ _ _ _ _ in love _ _ _ _ _ _
  when I leave the world __ _ be -- hind 
  the world __ _ be -- (be) -- hind
}


\score { 
  \transpose ef bf, \context StaffGroup <<
    #(set-accidental-style 'modern-voice-cautionary 'Score)
    \context Staff = "upper" <<
      \clef "treble_8"
      \key ef \major
      \context Voice = "tenor" \with {
        \consists "Ambitus_engraver"
      } {
        \override Ambitus #'X-offset = #2.0
        \tenor
      }
      \context Voice = "lead" \with {
        \consists "Ambitus_engraver"
      } \lead
    >>
    \new Lyrics = "leadLyrics" { s }
    \new Lyrics = "baritoneLyrics" { s } 
    \context Staff = "lower" <<
      \clef bass
      \key ef \major
      \context Voice = "baritone" \with {
        \consists "Ambitus_engraver"
      } {
        \override Ambitus #'X-offset = #2.0
        \baritone
      }
      \context Voice = "bass" \with {
        \consists "Ambitus_engraver"
      }\bass
    >>
    \context Lyrics = "leadLyrics" \lyricsto "lead" \leadWords
    \context Lyrics = "baritoneLyrics" \lyricsto "baritone" \baritoneWords
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

