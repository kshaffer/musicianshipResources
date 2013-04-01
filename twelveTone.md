---
layout: post
title: Analyzing 12-tone music
---

{{ page.title }}
================

The *pitch* material of a strict 12-tone work is entirely (or nearly entirely) derived from a single *12-tone row*. A row is an *ordered set* of the twelve pitch classes of the chromatic scale. Each of the 12 will appear exactly once, and order is paramount.

12-tone rows that can be related to each other by transposition, inversion, and/or retrograde operations are considered to be forms of the same row. Unless a row has certain properties that allow it to map onto itself when transposed, inverted, or retrograded, there will be 48 forms of the row: *prime* (**P**), *inversion* (**I**), *retrograde* (**R**), and *retrograde inversion* (**RI**) forms, transposed to begin on each of the 12 pitch classes.

### Prime form ###

The prime form of the row is the main form to which all other forms are referenced. In some pieces, one form of the row will clearly dominate the texture. If that is not the case, choose the most salient row at the beginning of the work and label it **P**. If more than one row seem equally salient at the beginning, flip a coin. The decision of which to call "prime" is not always important, but the analysis of the piece depends on a single row form serving as a point of reference.

Any row form that is the same as, or a strict transposition of, that opening prime form is also a prime form. Once you have labeled the main prime form at the beginning of the piece, any subsequent row that is an exact transposition of that row is prime. Likewise, any row that exhibits the same succession of pitch-class intervals is also a prime form.

Since **P** can be transposed to any pitch-class level, we distinguish them with subscripts. There are multiple common systems for deciding the numbering. The simplest, which we will follow in this course, is to number the row by its starting pitch class. If the prime form begins on G (7), it is **P<sub>7</sub>**; on B (11), **P<sub>11</sub>**.

### Retrograde form ###

A retrograde form of the row takes a prime form and exactly reverses the pitch classes. Its interval content, then, are the reverse of the prime forms. Retrograde forms are labeled **R** followed by a subscript denoting the *last* pitch class in the row. This will ensure that if two row forms are exact retrogrades of each other, they will have the same subscript.

For example, if a row has the exact reverse interval structure of the prime forms and ends on F-sharp (6), it is **R<sub>6</sub>**, regardless of its first pitch.

### Inversion form ###

A row form that exactly inverts the interval structure of the prime form (for example, 3 semitones up becomes 3 semitones down—or 9 semitones up, modulo12) is in inversion form. Inversion forms are labeled according to the first pitch class of the row form. An inversion-form row that begins on E-flat (3) is **I<sub>3</sub>**.

This label is not always the same as the inversion *operation* that produces it. (See the [Analyzing atonal music][atonal] resource.) If you begin with **P<sub>0</sub>**, the inversion operation and the resulting row form will have the same subscript. Otherwise, they will be different. Take care not to confuse them.

### Retrograde inversion ###

The relationship of retrograde inversion (**RI**) and inversion (**I**) forms is the same as that between retrograde (**R**) and prime (**P**). Retrograde inversion forms reverse the pitch classes of inversion forms and are named for the *last* pitch class in the row form.

# Interval progressions #

Once you have determined (or decided) which row is *prime*, analyze its interval content in *ordered pitch-class intervals*. This will help you determine if subsequent row forms are **P**, **I**, **R**, or **RI** (or if they do not belong to the same row family).

For example, the row for Schoenberg's Op. 25 is:  
[E, F, G, Db, Gb, Eb, Ab, D, B, C, A, Bb].

Its intervals (ascending pitch-class intervals, modulo12) are:  
1, 2, 6, 5, 9, 5, 6, 9, 1, 9, 1

(Notice that while no pitch class repeats in the row, several intervals appear more than once.)

The intervals of the inversion form of the row are the same size, opposite direction. You can calculate them by subtracting each of the prime-form intervals from 12:  
11, 10, 6, 7, 3, 7, 6, 3, 11, 3, 11

Retrograde intervals are tricky (at first). Reversing pitch classes *changes the direction of each interval*. Thus C–A (9) becomes A–C (3). Thus to get the interval progression of the retrograde forms, reverse the intervals of the *inversion*:  
11, 3, 11, 3, 6, 7, 3, 7, 6, 10, 11

(Test this out with the retrograde form of the row: Bb, A, C, B, . . .)

To get the interval succession of the retrograde forms, invert the retrograde interval progression, or reverse the prime interval progression:  
1, 9, 1, 9, 6, 5, 9, 5, 6, 2, 1

Take care in determining these first, and it will be easy to classify row forms as you go through a piece. Its interval progression will tell you the type, and the pitch class of the first or last note will give you the subscript. That subscript will tell you the transposition relationship between it and the other row forms of the same type.


[atonal]: atonal.html