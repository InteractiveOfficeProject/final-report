#!/bin/bash
FILE=$1

function printUsageAndExit {
  echo "Usage: ./compile.sh <tex-file-without-file-ending>"
  echo "  e.g. ./compile.sh Interactive_Office"
  exit 1
}

if [ "$#" -ne 1 ]; then
  printUsageAndExit
fi

rm -f $FILE.aux $FILE.bbl $FILE.blg $FILE.log $FILE.out $FILE.pdf $FILE.toc

pdflatex $FILE.tex
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "pdflatex failed"
  printUsageAndExit
fi

bibtex $FILE
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "bibtex failed"
  printUsageAndExit
fi

pdflatex $FILE.tex
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "pdflatex 2 failed"
  printUsageAndExit
fi

pdflatex $FILE.tex
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "pdflatex 3 failed"
  printUsageAndExit
fi

