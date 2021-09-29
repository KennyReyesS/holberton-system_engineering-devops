#!/usr/bin/python3
"""
Write a function that queries the Reddit API and returns the number
of subscribers (not active users, total subscribers) for a given subreddit.
If an invalid subreddit is given, the function should return 0.
"""

import requests


def number_of_subscribers(subreddit):
    """ Return total subscribers for a given subreddit """

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {'User-Agent': '"Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}

    res = requests.get(url, headers=headers, allow_redirects=False)

    if res.status_code == 200:
        return (res.json()['data']['subscribers'])
    else:
        return 0
