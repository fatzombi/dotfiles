import feedparser
import requests
from urllib.parse import urlparse
import xml.etree.ElementTree as ET

# Function to get feed name
def get_feed_name(url):
    try:
        feed = feedparser.parse(url)
        if feed.feed.title:
            return feed.feed.title
        else:
            return urlparse(url).netloc
    except Exception as e:
        print(f"Error fetching feed for {url}: {e}")
        return url

# Read URLs from text file
def read_urls_from_file(file_path):
    with open(file_path, 'r') as file:
        return [line.strip() for line in file if line.strip()]

# Generate OPML file
def generate_opml(urls, output_file):
    opml = ET.Element('opml', version='2.0')
    head = ET.SubElement(opml, 'head')
    ET.SubElement(head, 'title').text = "Feeds"
    body = ET.SubElement(opml, 'body')

    for url in urls:
        print(f'Processing {url}')
        feed_name = get_feed_name(url)
        ET.SubElement(body, 'outline', type='rss', text=feed_name, xmlUrl=url)

    tree = ET.ElementTree(opml)
    tree.write(output_file, encoding='utf-8', xml_declaration=True)
    print(f"OPML file '{output_file}' generated successfully.")

# Main function
def main():
    input_file = 'feeds.txt'  # Path to your text file containing URLs
    output_file = 'feeds.opml'  # Path to the output OPML file

    urls = read_urls_from_file(input_file)
    generate_opml(urls, output_file)

if __name__ == "__main__":
    main()
