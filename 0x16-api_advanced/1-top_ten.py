#!/usr/bin/python3
"""
Function that queries the Reddit API and prints the titles
of the first 10 hot posts listed for a given subreddit.
"""


import requests


def top_ten(subreddit):
    """ Prints the titles of the first 10 hot posts """

    url = "https://www.reddit.com/r/{}/hot.json?limit=10".format(subreddit)
    headers = {"user-agent": "Mozilla/5.0"}

    res = requests.get(url, headers=headers, allow_redirects=False)

    if res.status_code == 200:
        for post in res.json()['data']['children']:
            print(post['data']['title'])
    else:
        print(None)
