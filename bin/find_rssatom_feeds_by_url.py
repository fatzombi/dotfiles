import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

def read_urls(file_path):
    with open(file_path, 'r') as file:
        return [line.strip() for line in file]

def find_feeds(url):
    try:
        response = requests.get(url)
        soup = BeautifulSoup(response.content, 'html.parser')
        feeds = []
        for link in soup.find_all('link', type=['application/rss+xml', 'application/atom+xml']):
            href = link.get('href')
            if href:
                full_url = urljoin(url, href)
                feeds.append(full_url)
        return feeds
    except Exception as e:
        print(f"Error fetching {url}: {e}")
        return []

def write_feeds_to_file(feeds, file_path):
    with open(file_path, 'w') as file:
        for url, feed_links in feeds.items():
            file.write(f"Feeds found for {url}:\n")
            for feed in feed_links:
                file.write(f"  {feed}\n")
            file.write("\n")

def main():
    urls = read_urls('urls.txt')
    all_feeds = {}
    for url in urls:
        feeds = find_feeds(url)
        all_feeds[url] = feeds
        print(f"Feeds found for {url}: {feeds}")
    write_feeds_to_file(all_feeds, 'feeds_found.txt')

if __name__ == "__main__":
    main()
