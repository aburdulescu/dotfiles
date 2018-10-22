import requests
from bs4 import BeautifulSoup


url = 'https://mirrors.nav.ro/gnu/emacs/'
r = requests.get(url)
html_content = r.text
soup = BeautifulSoup(html_content, features='html.parser')

versions = [a['href'] for a in soup.find_all('a', href=True) if a['href'].startswith('emacs') and (a['href'].endswith('tar.xz') or a['href'].endswith('tar.gz'))]

for v in versions:
    print(v)
