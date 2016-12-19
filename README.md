# PDF Auto Search
This is meant to be used to track PDF document(s) that regularly change, and get email notifications when they include designated keywords. The emails include the PDFs as attachments as a manner of archiving them.

At the core of this are two rake tasks: `search` and `get_url_and_search`. If the PDF url is unchanging, use `search`. If the PDF url changes, but can be found in a link on a certain webpage, use `get_url_and_search`.

Example usage for an unchanging PDF url:

```
rake "search[Search Title,http://lorem.com/ipsum.pdf,text to monitor,email@tonotify.com]"
```

Example usage for a PDF url that changes, but can be found in a link on a certain page:

```
rake "get_url_and_search[Search Title,http://lorem.com/ipsum.html,text to monitor,email@tonotify.com]"
```

Uses [Mailgun](http://www.mailgun.com/). Must set `MAILGUN_API_KEY` and `MAILGUN_DOMAIN` environment variables.

Can be used with Heroku and [Heroku Scheduler](https://elements.heroku.com/addons/scheduler).

Released under the MIT License.

## The MIT License (MIT)
Copyright (c) 2016 Ryan Catalani

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.