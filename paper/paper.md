---
title: 'atrrr: An R package for Bluesky (analysis)'
tags:
  - R
  - social media
  - network analysis
authors:
  - name: Johannes B. Gruber
    orcid: 0000-0001-9177-1772
    corresponding: true # (This is how to denote the corresponding author)
    equal-contrib: false
    affiliation: 1
  - name: Benjamin Guinaudeau
    orcid: 0000-0001-9177-1772
    equal-contrib: false
    affiliation: 2
  - name: Fabio Votta
    orcid: 0000-0001-9177-1772
    equal-contrib: false
    affiliation: 1
affiliations:
 - name: University of Amsterdam
   index: 1
 - name: NYU’s Center of Social Media and Politics
   index: 2
date: 9 January 2024
bibliography: paper.bib
---

# Summary

The AT Protocol behind the social network site Bluesky is an open protocol licensed under a Dual MIT/Apache-2.0 License.
In early 2024, it is interesting for two reasons:
(1) the social network site Bluesky is growing rapidly in terms of user numbers and importance, as users turn away from X (formerly Twitter);
(2) through the Authenticated Transfer Protocol (atproto), access to Bluesky data is more open and more comprehesnive than any major social network before.

# Statement of need

The R package `atrrr` wraps all endpoints of the protocol through automated function generation, which facilitates a short reaction time when the unstable atproto changes---which its authors predict will happen frequently while development is ongoing.
Additionally, our package provides stable user facing functions that factilitate interacting with Bluesk---and eventually other platforms that use the protocl.
These unctions can be used for, among others, retrieving posts and followers from the network or posting content. 

`atrrr` was designed to be easy to use by students and experts alike.
This is to facilitate swift replacement packages such as `rtweet` [@rtweet-package] or `academictwitteR` [@academictwitteR], which rely on defunct endpoints that offered by Twitter until February 2023.
The discontinuation of the free tier enpoints, which had been used by thousands of academic projects [@gotfredsen_twitter] and in many introduction university courses, left a deep vacuum in the tool box of many reseachers and teachers.
`atrrr` attempts to fill this vacuum, although Bluesky is currently far less popular and influential than Twitter has been in the past.

# Background: atproto

The self-stated goal of Bluesky PBC is to develop the the Authenticated Transfer Protocol (atproto) into an open "protocol for public conversation and an open-source framework for building social apps, meaning people have transparency into how it is built and what is being developed" [@blueskyweb].
Specifically, this means that they are creating a standard format for user identity, follows, and data which can be used by anyone building an application or platform.
In the event of a (billionaire) takeover or otherwise triggered "enshittification" [@doctorowEnshittification] of Bluesky, users should in the future be able to move their identiy, data and friendship network to another platform with minimal friction [@blueskyweb].

# Auto-generated implementation

All endpoints and record types (e.g., identiiesin, posts, feeds) in the protocol are defined as so-called lexicons, which are written in JSON.
This makes it relativly straightforward to automatically wrap the API endpoints to communicate with services using atproto in essentially all programming languages.
A number of projects in Python, Go, Rust etc. already exist (see <https://atproto.com/community/projects>).
For the R langguage, we decided to automatically wrap the entire set of lexicons --- 105 at the time of writing.
These are not exported and hence invisible to the user (although they can be accessed with `atrrr:::com_*` and `atrrr:::app_*`).
Since the protocol is menat to change frequently during development (which is still ongoing), it does not seem worthwile to manually warp the endpoint, only to rewrite functions again in the near future.
Instead, we implemted user-facing functions based on the auto-generated endpoint wrappers.

To devlop user-facing functions on top of the auto-generated endpoint wrappers is straightforward and should be easy to accomplish by others who want to extend our package or build their own on top of `atrrr`.
Below, we show an example of a user-facing function that uses the internal `app_bsky_actor_get_profiles` to query information about a specific user profile.

```
get_user_info <- function(actor,
                          parse = TRUE,
                          .token = NULL) {

  # we need to use do.call so objects are passed to the right environment
  res <- do.call( 
    what = app_bsky_actor_get_profiles,
    args = list(
      actor,
      .token = .token, # tokens are handled automatically under the hood
      .return = "json"
    )) |>
    purrr::pluck("profiles")

  if (parse) {
    res <- parse_actors(res)
  }
  return(res)
}
```

# Usage

The package can be installed from CRAN (the Comprehensive R Archive Network):

```r
install.packages("atrrr")
```

or from GitHub using remotes [@remotes]:

``` r
# install.packages("remotes")
remotes::install_github("JBGruber/atrrr")
```

After that, the user should authenticate with their username.

``` r
library(atrrr)
auth("jbgruber.bsky.social")
```

This will open a browser and navigate to <https://bsky.app/settings/app-passwords>, where users can create an app password, as seen in \autoref{fig:pw}.
With this password, every user has unlimited access to the endpoints connecting to Bluesky free of charge and without special requirement for research access.
Users are asked to enter the password in a secure pop-up window and the resulting token is stored in an encryted file in the user's cache directory.
As long as the password is not revoked, the user will not have to repeat this step.
If no token is stored in the cache, the `auth` function is triggered automatically.

![Bluesky App Passwords \label{fig:pw}](figures/app_password.png)

We maintain a number of analysis examples at <https://jbgruber.github.io/atrrr/articles/>.
To highlight just ...

- `atrrr::search_post()`
- https://jbgruber.github.io/atrrr/articles/Networks.html#follower-network-visualization
- `post_skeet(text = "This post was made with the #rstats package {atrrr}", image = "https://jbgruber.github.io/atrrr/logo.png", image_alt = "The atrrr hex logo showing clouds and network edges in front of a blue sky")`

# References