awk '{printf "%s\\n", $0}' ###ZARF_VAR_CERT_FILE### | sed "s/\"/\\\\\"/g"
