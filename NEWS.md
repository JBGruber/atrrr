# atrrr (development version)

* fix bug in posting remote images and videos
* fix issue in auth() (httr2 v1.1.0 related)

# atrrr 0.0.5

* adds three new functions for lists: get_list(), get_list_feed(), and get_starter_pack()
* adapted to httr2 1.1.0
* now supports posting videos,several images and compresses images that are too large
* updated auto functions to reflect changes to the endpoints
* added new parameters to search_post()
* improves stability of preview cards in posts
* improves parsing of actor data


# atrrr 0.0.4

* adds option to include language, additional tags and labels to post
* fix issue with preview cards for cases with multiple links
* add search function to vignette (thank you for noticing, @SoaresAlisson)
* address issue with new version of glue package (thank you, @jennybc)
* add ability to post videos

# atrrr 0.0.3

* link preview cards are automatically added to posts (can be turned off)
* unified approach to parsing actor data
* new function: skeet_shot (high quality screenshots of skeets)
* properly paginate get_user_info (#14)
* hashtags can be searched and included in skeets now
* parsed skeets gained hashtag, links, and mentions column
* post_skeet/post now supports ggplot2 objects

# atrrr 0.0.2

* Initial CRAN submission.
