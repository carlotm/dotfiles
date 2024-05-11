#! /bin/sh

testEquality() {
  assertEquals 1 1
}

# testPartyLikeItIs1999() {
#   year=`date '+%Y'`
#   assertEquals "It's not 1999 :-(" '1999' "${year}"
# }

. shunit2
