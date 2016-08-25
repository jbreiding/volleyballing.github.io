# volleyballing.github.io
Copyright (C) Jeremy Breiding, Inc - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by Jeremy Breiding jbreiding@hotmail.com, 2016

This project is the home of the racker volleyball league website.

The goal is to ingress data through yaml files
 * Teams
 * Seasons
 * Standings
 * Playoffs
 * Champions???

Generate from these markdown pages by which pelican, at this time, will generate the website.
 * Entire season schedule is generated up front with dates in the future set to draft
 * Make is used to execute scaffolding and generation

Workflow today:
 1. Update season.yaml to reflect current season.
 2. Update teams.yaml to reflect current season.
 3. Execute, Make teams
 4. Execute, Make schedule
 5. Execute, Make update_source MSG="commit message"
 6. Execute, Make github

Added workflow tomorrow:
 1. Update schedule.yaml to reflect winners.
 2. Execute, Make standings
 3. Execute, Make schedule
 4. Execute, Make update_source MSG="commit message"
 5. Execute, Make github

The current host is github and this may change.

### TODO:
 1. Setup mailchimp to feed mailing lists from rss feeds
  * weather
  * schedule
  * roster
 2. Finalize wording around pages, e.g. guidelines, about, ...
 3. Playoff generator
 4. Seal and archive season
 5. Generate new season
 6. Sign up???
