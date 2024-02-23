import re
import sqlite3
from pathlib import Path

db = (
    str(Path("~").expanduser())
    + "/Library/Group Containers/9K33E3U3T4.net.shinyfrog.bear/Application Data/database.sqlite"
)
conn = sqlite3.connect(db)

notes_cur = conn.cursor()
for row in notes_cur.execute("SELECT ZTITLE, ZTEXT FROM ZSFNOTE WHERE ZTRASHED = 0"):
    note_title = row[0]
    note_content = row[1]

    wiki_link_pattern = r"\[\[([^\[\]]*?)\]\]"
    wiki_links = re.findall(wiki_link_pattern, note_content)

    for link in wiki_links:
        backlink_cur = conn.cursor()

        backlink_cur.execute(
            "SELECT COUNT(Z_PK) FROM ZSFNOTE WHERE ZTITLE = ?", (link,)
        )

        matches = backlink_cur.fetchone()[0]

        if matches == 0:
            print(f'"{note_title}" contains nonexistent backlink "{link}"')

        backlink_cur.close()


notes_cur.close()
conn.close()
