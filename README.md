# DFORMAT - A Program for Typesetting Data Formats

This is Jon Bentley's `dformat` program, reconstituted
from a PDF version of the original memo describing
the program.

## Introduction

`dformat` reads descriptions of data formats and turns them into
`pic` specifications.  It's intended for use as yet another `troff`
preprocessor.

It's of interest to me since it's written in `awk`.  It's been
around since sometime in the 1990s, but I've only ever seen either
PostScript or PDF versions of the memo.

I've often wanted to at least extract the `awk` program and make it
usable, but never got &ldquo;a round tuit.&rdquo;

In the fall of 2019 I came across a PDF copy of the memo and saved it
so that I could reconstitute the original `troff -ms` input for it, as
well as the `awk` code.  I finally stole some time to do this in
June of 2020.

## Process

I started by simply copying all the text from the PDF into a text file
via copy/paste.

The next step was to get the `awk` script put back together enough
to actually be run by `gawk` (my favorite `awk` interpreter).  Once
that was done, I used `gawk --pretty-print` to format the code
nicely.

I then started on the memorandum itself, inserting `troff -ms` requests,
formatting the text into lines of reasonable length, and getting
the document into shape to match the original as much as possible.

Fortunately, the memo contained the `dformat` input for all of the
figures displayed, so it was simple enough to copy/paste the
displayed input into real input to be processed, and then the
result could be compared visually to the original.

Along the way, I had to re-read the original documentation on `tbl`
so that I could format the tables properly. There was additional fun
here, as copy/paste of a table dumped the text by columns, not by rows.
I ended up saving each column to a small text file and then writing a
throw-away `awk` script to read the files and merge them back into lines.

Finally, I hand-edited the `awk` program to match what was in the
original memorandum.

## Bugs In the Document

Along the way, I found a few bugs in the document. There were two cases
where input for a figure was shown, but the figure itself was not.
I restored the actual figures.

Another figure needed an additional directive in order to be drawn
correctly; this directive was missing in the `dformat` input shown
in the PDF file. This too I corrected.

Finally, the `dash` alias for `dashed` did not work. I noted this in
a footnote and simply replaced `dash` with `dashed` in both the
real input and in the sample input shown in the memo.

## Conclusion

I'm pretty pleased with the result.  I'm making everything available on
GitHub so that others may also take advantage of this nice little program.

#### Last Modified

Thu Jun 18 10:28:49 IDT 2020
