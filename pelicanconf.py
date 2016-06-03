#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Tripsie'
SITENAME = u'VolleyBalling'
SITEURL = 'http://volleyballing.github.io'
PATH = 'content'

TIMEZONE = 'CST6CDT'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = 'feeds/all.atom.xml'
FEED_ALL_RSS = 'feeds/all.rss.xml'
CATEGORY_FEED_ATOM = 'feeds/%s.atom.xml'
CATEGORY_FEED_RSS = 'feeds/%s.rss.xml'
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None
# ARTICLE_ORDER_BY = 'basename'
THEME = 'themes/pelican-bootstrap3'
# Blogroll
LINKS = []
TYPOGRIFY = True
# Social widget
SOCIAL = [('github',
           'https://github.com/volleyballing/volleyballing.github.io')]
DISQUS_SITENAME = 'volleyballing'
DEFAULT_PAGINATION = False
# CSS_FILE = "wide.css"
# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True
WITH_FUTURE_DATES = False
DEFAULT_DATE = 'fs'
MAIN_MENU = True
MENUITEMS = ()
GITHUB_URL = 'https://github.com/volleyballing/volleyballing.github.io'
STATIC_PATHS = ['images', 'extra/robots.txt', 'extra/favicon.ico']
EXTRA_PATH_METADATA = {
    'extra/robots.txt': {'path': 'robots.txt'},
    'extra/favicon.ico': {'path': 'favicon.ico'}
}
BOOTSTRAP_THEME = 'flatly'
ABOUT_ME = 'Just a racker ballin...'
AVATAR = '/images/emblemmatic-racker-volleyball-league-logo-804.svg'

PLUGIN_PATHS = ["plugins"]
PLUGINS = ['series', 'md-metayaml']
