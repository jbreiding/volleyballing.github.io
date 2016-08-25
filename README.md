[![Build Status](https://travis-ci.org/volleyballing/volleyballing.github.io.svg?branch=source)](https://travis-ci.org/volleyballing/volleyballing.github.io)

# volleyballing.github.io
Copyright (C) Jeremy Breiding, Inc - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by Jeremy Breiding jbreiding@hotmail.com, 2016

This project is the home of the racker volleyball league website.

The goal is to ingress data through yaml files
 * Teams
 * Seasons
 * Schedules
 * Standings
 * Playoffs
 * Champions???

Generate from these markdown pages by which pelican, at this time, will generate the website.
 * Entire season schedule is generated up front
 * Make is used to execute scaffolding and generation

Workflow to open a season:
 1. Update season.yaml to reflect current season.
 2. Update teams.yaml to reflect current season.
 3. Execute, Make teams
 4. Execute, Make schedule
 5. Execute, Make update_source
 6. Execute, Make github

Added workflow to close a night:
 1. Update schedule.yaml to reflect winners.
 2. Execute, Make schedule
 3. Execute, Make standings
 4. Execute, Make update_source
 5. Execute, Make github

The current host is github and this may change.
