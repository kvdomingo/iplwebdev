import urllib
import requests
import pandas as pd
from selenium import webdriver
from bs4 import BeautifulSoup

url = 'https://paperview.spp-online.org/proceedings/issue/view/SPP-2019'
driver = webdriver.Firefox()
driver.get(url)
content = driver.page_source
soup = BeautifulSoup(content)

authors = []
titles = []
url_codes = []

for d in soup.findAll('div', attrs={'class': 'obj_article_summary'}):
    title = d.find('a', href=True).text.strip('\n\t')
    author = d.find('div', attrs={'class': 'authors'}).text.strip('\n\t')
    url_code = d.find('div', attrs={'class': 'pages'}).text.strip('\n\t')

    if any(a in author for a in ['Saloma', 'Soriano', 'Lim', 'Tapang', 'Bantang']):
        titles.append(title)
        authors.append(author)
        url_codes.append('-'.join(url_code.split('-')[2:]))

data_arr = [(a, t, u) for a, t, u in zip(authors, titles, url_codes)]
df = pd.DataFrame(data=data_arr,
                  columns=['author', 'title', 'spp_code'])
df.to_csv('ipl_spp_2019.csv')
