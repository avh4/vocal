
\header {  
  title = "Sincere"
  subtitle = ""
  tagline = ""   
  poet = ""
  composer = ""
}

#(set-global-staff-size 20)	
\include "english.ly"

global = {
  \time 3/4
  \key af \major
}

lead = \relative c {
  \voiceTwo
  c4 df d | ef f g | af bf c | df2( c4) |
  c bf af | c ef, bf' | af c b | c2. | \break
  f,4 af bf | cf bf af | ef2 af4 | c2. |
  d,4 f g | af2 c4 | bf bf c | df ef ef | \break
  
  ef c af | gf af bf | g2. | af2 df,4 |
  d ef f | f g af | bf bf d | df2. | \break
  c,4 df d | ef f g | af bf c ef2. |
  df4 c bf | f g ef | af \times 2/3 { ef'4 d df } | c2.
  \bar "|."
}

leadWords = \lyricmode {
  How can there be an -- y sin in “Sin -- cere,” __
  Where is the good in good -- bye, in good -- bye?
  Your ap -- pre -- hen -- sions con -- fuse me, dear,
  puz -- zle and mys -- ti -- fy, mys -- ti -- fy. Tell me,
  
  what can be fair in fare -- well, dear, while
  one sin -- gle star shines a -- bove, shines a -- bove?
  How can there be an -- y sin in “Sin -- cere?”
  Aren't we sin -- cere -- ly in love? Oh, we're in love. __
}


tenor = \relative c {
  \voiceOne
  ef'4 ef f | ef g e | f e ef | f2( ef4) |
  d4 d d | ef df df | c ef f | gf2. |
  df4 df df | f f f | c2 c4 | ef2. |
  f4 d d | d2 d4 | df d ef | ef fs g |
  
  gf4 gf gf | ef f gf | e2. | f2 f4 |
  f4 f d | d d d | df d f | g2. |
  ef4 ef f | ef g e | f g af | a2. |
  f4 f f | d df df | c \times 2/3 { gf'4 f e } | ef4( af2)
}


bass = \relative c {
  \voiceTwo
  af4 bf b | c d c | f g gf | f2. |
  f4 f bf, | ef bf ef | af, ef' d | ef2. |
  df4 df df | df df df | af2 ef'4 | f2. |
  bf,4 bf bf | f'2 f4 | ef f fs | g a bf |
  
  af4 ef ef | af, af ef' | c2. | df2 df 4 |
  bf c bf | bf bf bf ef f bf, | ef2. |
  af,4 bf b | c d c | f e ef | f2. |
  bf,4 c df | bf ef bf | af \times 2/3 { af'4 af af } af,2.
} 

baritone = \relative c {
  \voiceOne
  af'4 g af | af b bf | c c bf | a2. |
  af4 af f | g g g | ef af af | bf2( af4) |
  af4 f f | af af bf | af2 gf4 | a2. |
  af4 af bf | bf2 af4 | g4 af a | bf c df |
  
  c4 af c | c c c | bf2. | df2 af4 |
  bf4 a af | af bf f | g af af | bf2. |
  af4 g af | af b bf | c c ef | c2. |
  f,4 af af | af bf g | ef \times 2/3 { c'4 cf bf } | af4( ef2)
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

