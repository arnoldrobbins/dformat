awk '
inlang == 0 { if ($0 !~ /^\.begin[ \t]/ || $2 != "dformat") print
              else { inlang = 1; print ".PS"; boxacnt = 0 }
              next
            }
/^\.end/    { inlang = 0; print ".PE"; next }
/^[^ \t]/   { printf "BoxA: box invis ht 0.3 wid 0"
              if (boxacnt++) printf " with .n at BoxA.s - (0,0.15)"
              printf "\n"
              printf " \"%s: \" rjust at BoxA.w\n", $0
              printf " BoxB: box invis ht 0.3 wid 0 at BoxA\n"
              next
           }
/./        {
              range = $1; $1 = ""
              gsub(/^[ \t]+/, "", $0); gsub(/[ \t]+$/, "", $0); text = $0
              n = split(range, x, "-")
              rlo = x[1]
              rhi = (n >= 2) ? x[2] : rlo
              rwid = rhi - rlo + 1
              printf " BoxB: box %s ht .3 wid %g with .w at BoxB.e\n",
	              btype, rwid * .2
              printf "    \"%s\" at BoxB.c\n", text
              printf "\t\" \\s-4%s\\s+4\" ljust at BoxB.sw + (0,.06)\n", rlo
              printf "\t\"\\s-4%s\\s+4 \" rjust at BoxB.se + (0,.06)\n", rhi
           }
' $*
