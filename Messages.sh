#! /bin/sh
# Run this file to update message catalogs under po/
#
# This file is in the public domain.

set -e

XGETTEXT="xgettext --keyword=_ --keyword=N_ --keyword=__ --keyword=__x --default-domain=fntsample --add-comments=TRANSLATORS: --foreign-user --package-name fntsample --msgid-bugs-address=eugen@debian.org"
MSGMERGE="msgmerge --backup=none --update --verbose"

${XGETTEXT} fntsample.c read_blocks.c pdfoutline.pl -o po/fntsample.pot

for po_file in po/*.po
do
  ${MSGMERGE} ${po_file} po/fntsample.pot
done
