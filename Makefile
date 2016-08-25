#Copyright (C) Jeremy Breiding, Inc - All Rights Reserved
#Unauthorized copying of this file, via any medium is strictly prohibited
#Proprietary and confidential
#Written by Jeremy Breiding jbreiding@hotmail.com, 2016
PY?=python
PELICAN?=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

GITHUB_PAGES_BRANCH=master
GITHUB_SOURCE_BRANCH=source
GITHUB_REMOTE=origin

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

help:
	@echo 'Makefile for a pelican Web site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make html                           (re)generate the web site          '
	@echo '   make clean                          remove the generated files         '
	@echo '   make regenerate                     regenerate files upon modification '
	@echo '   make publish                        generate using production settings '
	@echo '   make serve [PORT=8000]              serve site at http://localhost:8000'
	@echo '   make serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80    '
	@echo '   make devserver [PORT=8000]          start/restart develop_server.sh    '
	@echo '   make stopserver                     stop local server                  '
	@echo '   make github                         upload the web site via gh-pages   '
	@echo '   make teams                          generate the roster page after updating yamls'
	@echo '   make schedule                       generate the schedule for the season'
	@echo '   make standings                      update the standings for the season'
	@echo '   make update_source		          upload the source to github branch '
	@echo '                                                                          '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
	@echo '                                                                          '

html:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
ifdef PORT
	cd $(OUTPUTDIR) && $(PY) -m pelican.server $(PORT)
else
	cd $(OUTPUTDIR) && $(PY) -m pelican.server
endif

serve-global:
ifdef SERVER
	cd $(OUTPUTDIR) && $(PY) -m pelican.server 80 $(SERVER)
else
	cd $(OUTPUTDIR) && $(PY) -m pelican.server 80 0.0.0.0
endif


devserver:
ifdef PORT
	$(BASEDIR)/develop_server.sh restart $(PORT)
else
	$(BASEDIR)/develop_server.sh restart
endif

schedule:
	$(BASEDIR)/sportscastr --schedule
	@echo 'Generated schedules for the season'

teams:
	$(BASEDIR)/sportscastr --teams
	@echo 'Generated roster page'

standings:
	$(BASEDIR)/sportscastr --standings
	@echo 'Generated standings page'

stopserver:
	$(BASEDIR)/develop_server.sh stop
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

publish:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

github: publish
	ghp-import -m "Generate Pelican site" -r $(GITHUB_REMOTE) -b $(GITHUB_PAGES_BRANCH) $(OUTPUTDIR)
	git push -fq $(GITHUB_REMOTE) $(GITHUB_PAGES_BRANCH)

travis_github: publish
	ghp-import -m "Travis Generated Pelican site" -r upstream -b $(GITHUB_PAGES_BRANCH) $(OUTPUTDIR)
	@git push -fq upstream  $(GITHUB_PAGES_BRANCH) > /dev/null

update_source:
	git add -A .
	git commit -m "`date +'%Y-%m-%d %H:%M:%S'`"
	git push $(GITHUB_REMOTE) $(GITHUB_SOURCE_BRANCH)

travis_update_source:
	@git config user.name jbreiding > /dev/null
	@git config user.email jbreiding@hotmail.com > /dev/null
	git add -A .
	git commit -m "travis commit `date +'%Y-%m-%d %H:%M:%S'`"
	@git remote add upstream https://${GH_TOKEN}@github.com/$(TRAVIS_REPO_SLUG).git > /dev/null
	@git push -fq upstream $(GITHUB_SOURCE_BRANCH) > /dev/null

travis: teams schedule standings travis_update_source travis_github

.PHONY: standings update_source html help clean regenerate serve serve-global devserver publish github teams schedule travis_github travis_update_source
