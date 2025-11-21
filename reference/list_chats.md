# Interact with Bluesky Direct Messages

Interact with Bluesky Direct Messages

## Usage

``` r
list_chats(
  limit = NULL,
  cursor = NULL,
  unread = FALSE,
  status = NULL,
  parse = TRUE,
  .token = NULL
)

get_user_chat(actor, parse = TRUE, .token = NULL)

check_user_chat_available(actor, parse = TRUE, .token = NULL)

send_chat_message(chat_id, text, .token = NULL)
```

## Arguments

- limit:

  Maximum number of records to return. For queries with more than 100
  results, pagination is used automatically (one request per 100
  results). The function stops when the limit is reached, but you will
  usually get a few items more than requested.

- cursor:

  Cursor for pagination (to pick up an old search).

- unread:

  `TRUE`/`FALSE` only show chats with unread messages.

- status:

  `request` or `accepted`.

- parse:

  Parse the results or return the original nested object sent by the
  server.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

- actor:

  user DID or handle to get chats for.

- chat_id:

  id of the chat. You can get it with `list_chats`, `get_user_chat`, or
  `check_user_chat_available`.

- text:

  text to send to other user.

## Value

different objects.

## Examples

``` r
if (FALSE) { # \dontrun{
list_chats(readState = "read")
} # }
```
