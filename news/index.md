# Changelog

## atrrr (development version)

- adds experimental firehose implementation
- some updates to parsing functions

## atrrr 0.1.1

CRAN release: 2025-07-22

- adds functions for direct messages
- adds function to query starter packs from a user
- simplifies make_request and make it compatible with future httr2
  versions
- get_user_info now uses app_bsky_actor_get_profile to query individual
  profiles (see [\#39](https://github.com/JBGruber/atrrr/issues/39))

## atrrr 0.1.0

CRAN release: 2025-01-20

- fix bug in posting remote images and videos
- fix issue in auth() (httr2 v1.1.0 related)
- adds ability to post multiple images in thread (thanks
  [@nerskin](https://github.com/nerskin)!)

## atrrr 0.0.5

CRAN release: 2025-01-19

- adds three new functions for lists: get_list(), get_list_feed(), and
  get_starter_pack()
- adapted to httr2 1.1.0
- now supports posting videos,several images and compresses images that
  are too large
- updated auto functions to reflect changes to the endpoints
- added new parameters to search_post()
- improves stability of preview cards in posts
- improves parsing of actor data

## atrrr 0.0.4

CRAN release: 2024-10-03

- adds option to include language, additional tags and labels to post
- fix issue with preview cards for cases with multiple links
- add search function to vignette (thank you for noticing,
  [@SoaresAlisson](https://github.com/SoaresAlisson))
- address issue with new version of glue package (thank you,
  [@jennybc](https://github.com/jennybc))
- add ability to post videos

## atrrr 0.0.3

CRAN release: 2024-03-05

- link preview cards are automatically added to posts (can be turned
  off)
- unified approach to parsing actor data
- new function: skeet_shot (high quality screenshots of skeets)
- properly paginate get_user_info
  ([\#14](https://github.com/JBGruber/atrrr/issues/14))
- hashtags can be searched and included in skeets now
- parsed skeets gained hashtag, links, and mentions column
- post_skeet/post now supports ggplot2 objects

## atrrr 0.0.2

CRAN release: 2024-01-10

- Initial CRAN submission.
