import sqlite3
from pathlib import Path

db = (
    str(Path("~").expanduser())
    + "/Library/Group Containers/9K33E3U3T4.net.shinyfrog.bear/Application Data/database.sqlite"
)
def get_bear_note_titles(db):
    # Connect to the SQLite database
    conn = sqlite3.connect(db)
    cursor = conn.cursor()

    # Execute SQL query to fetch all note titles
    cursor.execute("SELECT ZTITLE FROM ZSFNOTE WHERE ZTRASHED = 0 AND ZARCHIVED = 0")
    
    # Fetch all results
    note_titles = cursor.fetchall()
    
    # Close the database connection
    conn.close()

    # Process the fetched titles
    titles = [title[0] for title in note_titles if title[0] is not None]
    
    return titles

# Usage
if __name__ == "__main__":
    titles = get_bear_note_titles(db)
    for title in titles:
        print(title)
