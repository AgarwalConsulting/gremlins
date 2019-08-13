#!/usr/bin/env bash

set -e

_output_code=0

echo "Checking for duplicates..."
_highest_count=$(grep -v '^$' student-names.txt | sort | uniq -c | sort -n | tail -n 1 | cut -d ' ' -f 4,7)
if [ $_highest_count -eq 1 ]; then
  echo "Pass"
else
  echo "Fail"
  _ouput_code=1
fi

echo "Checking for conflict identifiers..."
_conflict_identifiers=$(grep -e '<<<\|===\|>>>' student-names.txt | wc -l)
if [ $_conflict_identifiers -eq 0 ]; then
  echo "Pass"
else
  echo "Fail"
  _ouput_code=1
fi

echo "Checking for excess empty lines..."
_empty_lines=$(grep '^\s*$' student-names.txt | wc -l)
if [ $_empty_lines -eq 0 ]; then
  echo "Pass"
else
  echo "Fail"
  _ouput_code=1
fi

echo "Checking for sort order..."
if sort -C student-names.txt; then
  echo "Pass"
else
  echo "Fail"
  _ouput_code=1
fi

exit $_ouput_code
