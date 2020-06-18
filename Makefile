# Makefile to format the dformat memorandum.
# Arnold Robbins
# arnold@skeeve.com
# June, 2020

dformat.pdf: dformat.ms dformat.awk
	awk -f dformat.awk dformat.ms | pic | tbl | eqn | groff -Tps -ms | ps2pdf - dformat.pdf

clean:
	$(RM) dformat.pdf
