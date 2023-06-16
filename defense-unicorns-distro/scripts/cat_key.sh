awk '{printf "%s\\n", $0}' ###ZARF_VAR_KEY_FILE### | sed "s/\"/\\\\\"/g"
