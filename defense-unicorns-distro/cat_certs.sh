awk '{printf "%s\\n", $0}' tom.bigbang.dev.cert | sed "s/\"/\\\\\"/g"