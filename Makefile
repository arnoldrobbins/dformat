# Makefile to format the dformat memorandum.
# Arnold Robbins
# arnold@skeeve.com
# June, 2020

SED_SCRIPT= -e 's;\\;\\e;g' -e 's/^/\\\&/'

dformat.pdf: dformat.ms dformat.awk.tr trivial.sh.tr
	awk -f dformat.awk dformat.ms | pic | tbl | eqn | groff -Tps -ms | ps2pdf - dformat.pdf

dformat.awk.tr: dformat.awk
	sed $(SED_SCRIPT) < $< > $@

trivial.sh.tr: trivial.sh
	sed $(SED_SCRIPT) < $< > $@

clean:
	$(RM) dformat.pdf dformat.awk.tr trivial.sh.tr
