import re
import sqlite3
from pathlib import Path

ignore_list = ["Cloud", "Stratum"]

db = (
    str(Path("~").expanduser())
    + "/Library/Group Containers/9K33E3U3T4.net.shinyfrog.bear/Application Data/database.sqlite"
)
conn = sqlite3.connect(db)

notes_cur = conn.cursor()

notes_cur.execute("SELECT ZTITLE, ZTEXT FROM ZSFNOTE WHERE ZTRASHED = 0")
notes =  notes_cur.fetchall()

note_titles = {title: [] for title, _ in notes}

for title, content in notes:
    for search_title in note_titles:
        '''
        I think there is an issue when we have note titles that are a subset of other note titles.
        For example, I have "Amazon Kinesis" as one note and "Amazon Kinesis Data Streams" as 
        another note. If I link to Data Streams, it then reports that I don't have a link to
        the "parent" note.
        '''
        search_title_formatted = search_title.replace('[', '').replace(']', '')
        if search_title_formatted not in ignore_list and title != search_title_formatted and search_title_formatted in content and f'[[{search_title_formatted}]]' not in content:
            print(f'"{title}" contains unlinked reference of "{search_title_formatted}"')

notes_cur.close()
conn.close()


