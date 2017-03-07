#!/bin/bash
FILE="sda"
pdflatex $FILE.tex
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "pdflatex failed"
  exit 1
fi

bibtex $FILE
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "bibtex failed"
  exit 1
fi

pdflatex $FILE.tex
RESULT=$?
if [ $RESULT -nne 0 ]; then
  echo "pdflatex 2 failed"
  exit 1
fi
pdflatex $FILE.tex
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "pdflatex 3 failed"
  exit 1
fi

