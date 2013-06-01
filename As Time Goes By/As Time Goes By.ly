
\header {  
  title = "As Time Goes By"
  subtitle = ""
  tagline = ""   
  poet = ""
  composer = ""
}

#(set-global-staff-size 20)	
\include "english.ly"

global = {
  \time 4/4
  \key df \major
}

lead = \relative c {
  \voiceTwo
  f af af af af bf bf bf bf df df c df c bf
  af c c c c bf af
  f bf bf bf bf af gf
  f gf ef ef ef ef af af
  gf f f f f bf bf
  af bf c c c c c bf af  bf c c c c c af
  af bf bf bf bf c ef c af af af af bf
  f gf gf gf gf bf df bf gf ef ef ef ef af

  \bar "|."
}

leadWords = \lyricmode {
This day and age we're liv -- ing in gives cause for ap -- pre -- hen -- sion
with speed and new in -- ven -- tion
and things like third dim -- en -- sion
but we get a tri -- fle wear -- y 
of Mis -- ter Ein -- stein's the -- ory
so we must get down to worth at times re -- lax re -- leive the ten -- sion
no mat -- ter what the pro -- gress or what may yet be tried
the sim -- ple things in life are such they can -- not be de -- nied

You must remember this
A kiss is just a kiss
A sigh is just sigh __
The fundamental things apply
as time goes by
As time goes by

And when two lovers woo
They still say I love you
On that you can rely __
No matter what the future brings
As time goes by
Time goes by __

Moonlight and lvoes songs never out of sate
Hearst souto of passion jealuousty and hate
Woman loves man and man must have his mate
That no one can deny

It's still the same old story
a fight for love and glory
a case of do or die __ do or die
The world will always welcome lovers
As time goes by.

The world will alwyas welcome lovers
As time goes by
}


tenor = \relative c {
  \voiceOne
  r f' f f f f f f f fs fs fs fs fs fs fs
  f f f f f f
  
}


bass = \relative c {
  \voiceTwo
  r df df df df bf bf bf bf ef ef ef ef ef ef
  ef f f f f df df df f f f f bf, bf
  bf bf bf bf a a ef' ef ef df df c c bf bf
  r r f' f f f g g c, g' f f e e ef ef
  d ef ef ef ef af af ef df df b b f'
  bf, ef ef ef ef ef gf ef bf bf bf a a ef'

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

