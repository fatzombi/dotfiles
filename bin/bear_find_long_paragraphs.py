import os
import re
import sqlite3
from pathlib import Path

notes_violating_principles = {}

db = (
    str(Path("~").expanduser())
    + "/Library/Group Containers/9K33E3U3T4.net.shinyfrog.bear/Application Data/database.sqlite"
)
conn = sqlite3.connect(db)

pattern = re.compile(r"---(.*?)---", re.DOTALL)

notes_cur = conn.cursor()
for row in notes_cur.execute("SELECT ZTITLE, ZTEXT FROM ZSFNOTE WHERE ZTRASHED = 0"):
    note_title = row[0]
    note_content = row[1]

    note_content = re.search(pattern, note_content)
    if note_content:
        note_content = note_content.group(1).replace('---', '')
    else:
        continue

    paragraphs = [line for line in note_content.split("\n") if line.strip()]

    for paragraph in paragraphs:
        # If we are quoting something, we don't want it to account for the paragraph length
        if paragraph.startswith('>'):
            continue

        sentences = re.split(r'(?<!\w\.\w.)(?<![A-Z][a-z]\.)(?<=\.|\?)\s', paragraph)
        num_sentences = len(sentences)

        words = paragraph.split()
        num_words = len(words)

        if num_sentences > 5 or num_words > 150:
            if note_title in notes_violating_principles.keys():
                notes_violating_principles[note_title].append(paragraph)
            else:
                notes_violating_principles[note_title] = [paragraph]   

for note in notes_violating_principles:
    print(f'"{note}" violates our principles.')
    for para in notes_violating_principles[note]:
        print(f'\t{para}')
    print(os.linesep)

notes_cur.close()
conn.close()

