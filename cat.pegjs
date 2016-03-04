start
  = !'\n' sections:section* { return sections }

id = '[' str:$([0-9]+) ']' { return parseInt(str) }

section
  = '\n'? '-%- ' attr:sectionAttr ' -%-\n\n' data:sectionData {
        attr.data = data; return attr;
    }

sectionAttr
  = id:id ' ' name:$((!' -%-' !'\n' .)+) {
        return { id, name };
    }

sectionData
  = $((!'\n-%- ' .)*)
