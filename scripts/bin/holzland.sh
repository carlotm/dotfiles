#!/bin/bash

URL=https://www.holzland.de/merchants/
TEMPFILE=$(mktemp)

wget -O $TEMPFILE $URL

sed -n 's/^.*<a href="mailto:\(.*@.*\.[a-z]*\)" class="link-primary email-link".*$/\1/p' $TEMPFILE

rm -f $TEMPFILE
