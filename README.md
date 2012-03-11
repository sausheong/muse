# Muse

Muse is a Ruby DSL for making music. Unlike MIDI, which is a specification for music in a digital form, Muse actually creates the WAV music files itself.

WARNING: This is pre-alpha software where bugs abound and snap and gnash at every mistake you make. Use at your own risk!

If you are keen on music and Ruby, and would like to help out, I'm more than glad to accept more developers! Or musicians. Or both.

## The idea

While Muse can certainly be used to write (or recreate) songs from sheet music (you need to manually transcribe it though), it's probably more interesting and useful for dynamically generating songs.

The idea I had in my head when I started writing Muse is to be able to slurp in data and convert it into music. For example, how would your tweets sound like? If you grab your tweet stream and convert (how you do it is up to you, a Muse score is just a Ruby script after all) it into a piece of music how would it sound like? Or your emails? Or your holiday pictures?

Yes, I know the examples in my songs folder are all existing songs.

## Installing

To use Muse, install the gem.

    gem install muse

Then write your songs, requiring the library in your song.

    require 'muse'

## Using Muse

Since each Muse song you write is actually a Ruby program, simply run it the way you're used to run a Ruby program, and it will generate a WAV file.

## Basics of Muse

There are 3 levels to be mindful of when writing a song in Muse.

* Song - this is the highest level and represents an entire song
* Bar - this represents a single bar in sheet music and contains a number of notes
* Note - this represents a single musical note

It's important to remember that when you write in Muse you're not writing sheet music. Things like clef or time signatures are no longer important. Even though Muse has a concept of bar of notes, this is merely a convenience. You don't need to have multiple bars, but it's neater to do so.

At this point there are still a number of features not available in Muse, for example you can't do slurs easily.

## Song

A song is a collection of bars. You can set the name of the song, which then translates to the name of the WAV file that is created.

    Song.record "this_is_my_song" do
       ...
    end

The example above creates a file named this\_is\_my\_song.wav.

## Bar

A bar is a collection of notes. You can set 3 options that will be kept throughout the whole bar.

* beat - (b) The time for each note in the bar
* beats per minute - (bpm) The number of beats per minute. This determines how fast each beat is in actual time
* ADSR - (adsr) How the note sounds.

You can group bars together in order to play them at the same time. For example.

    bar(3,b:0.25).notes   {e4 b:0.5; _ b:0.5; f4; e4; dis4; e4;}
    bar(3,b:0.5).notes    {a3; c3_e3; c3_e3; c3_e3;}

To play 2 or more bars at the same time, just use the same number for the bar. In the example above, there are 2 bar 3s, so both of these bars are played together.

Notice that bars don't need to have the same beat. However, beat of all the notes in each bar summed together, must be the same. In the example above, the beats in the notes in the first bar summed must be the same as the second bar. If they don't match, the bar with the longer timing will find the notes truncated to fit the shorter bar. 

## Note

Each note is indicated by an alphabet from `a` to `g`. Sharps is indicated by adding a `is` to the end of the note. For example `ais` is A-sharp. There are no flats in Muse since you can always use a sharp where a flat is.

There is a number added as a suffix to each note, which indicates the octave of the note. The note `c3` is the middle-C. The whole octave `3` is the default, and if you don't have a suffix for your note, it's assumed to be in octave `3`. 

At this point in time, Muse extends from octave `2` to `5` only. Adding more octaves is easy but I'm lazy.

There are 3 options you can use in a note.

* beat - (b) This is the time for the note. The default is 1 if you don't specify, unless it's set at the bar level.
* volume - (v) This is how loud the note should be. The default is 10.
* ADSR - (a) This indicates how the note should sound. The default ADSR is a cosine wave (check the code please).

Use this keyboard as a reference when writing music.

[Keyboard reference](/sausheong/muse/keyboard-piano-notes.png)

## Keeping time

To keep time in Muse you can use 2 options. The first is the `bpm` or beats per minute. This is set at the bar level and the default is 120bpm. The second is the `beat` duration. This can be set at the bar level or at the individual note level. A beat is equivalent to a crochet (or a quarter note) in musical notation. 

To indicate a crochet or quarter note at the note level:

    a b:1;
    
To indicate a quaver or eighth note at the bar level:

    bar(1,b:0.5).notes {c; e; g;}
    
Each note in the bar above will be half a beat.

## Playing more than one note at a time

To play double notes or chords or even more notes at the same time, you can concatenate them with underscores like this:

    c_e_g; 
    
This plays 3 notes C, E and G at the same time. This can take in options just like any note. For example:

    c_e_g b:1;
    
This plays the chord for 1 beat.

## Chords

You can also play chords. The convention for a chord is to start with an underscore. The root note is capitalized. If it's a major chord an `M` is added as a suffix, if it's a minor chord an `m` is added instead and so on. Some examples of chords are:

    _CM; _D7; _Fm;
    
Which represents the C major, D7 and F minor chords accordingly. Chords, just like multiple notes, can have the same options as notes have.

## Examples

For examples look into the songs folder. This is an example of the first 9 bars of Alla Turca by Mozart.

Here's the original music score, public domain from the [Mutopia Project](http://www.mutopiaproject.org/cgibin/make-table.cgi?searchingfor=rondo+alla+turca).

[First 9 bars of Alla Turca](/sausheong/muse/turkish_march.png)

    require "muse"
    include Muse

    # Mozart's Piano Sonata No. 11 3rd Movement (All Turca)
    # more popularly known as the 'Turkish March' or 'Turkish Rondo'
    # first 9 bars only

    Song.record 'turkish_march' do
      bar(1,b:0.25).notes   {b4; a4; gis4; a4;}

      bar(2,b:0.25).notes   {c5 b:0.5; _ b:0.5; d5; c5; b4; c5;}
      bar(2,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

      bar(3,b:0.25).notes   {e5 b:0.5; _ b:0.5; f5; e5; dis5; e5;}
      bar(3,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

      bar(4,b:0.25).notes   {b5; a5; gis5; a5; b5; a5; gis5; a5;}
      bar(4,b:0.5).notes    {a3;     c4_e4;    a3;     c4_e4;}  

      bar(5,b:0.5).notes    {c6 b:1;            a5;     c6;}
      bar(5,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

      bar(6,b:0.5).notes    {b5; fis5_a5; e5_g5; fis5_a5; }
      bar(6,b:0.5).notes    {a3; b4_e4; b4_e4; b4_e4;}  

      bar(7,b:0.5).notes    {b5; fis5_a5; e5_g5; fis5_a5; }
      bar(7,b:0.5).notes    {a3; b4_e4; b4_e4; b4_e4;}  

      bar(8,b:0.5).notes    {b5; fis5_a5; e5_g5; dis5_eis5; }
      bar(8,b:0.5).notes    {a3; b4_e4; b2; b4;}  

      bar(9).notes          {e5}
      bar(9).notes          {e4}  
    end

