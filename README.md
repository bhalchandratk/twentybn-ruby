# TwentyBN

This gem implements a client for the TwentyBN deep learning API for Ruby or Ruby on Rails. This is a beta version and currently only offers access to the TwentyBN image tagging API, which can be used to recognizing objects in images.

## Installation

Add this line to your application's Gemfile:

    gem 'twentybn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twentybn

## API key

In order to get an API key, you need to sign up for free at https://cortex.twentybn.com.

## Basic usage

```ruby
require 'twentybn'
TwentyBN.api_key = 'PUT_API_KEY_HERE'
tags = TwentyBN.image("/path/to/an/image.jpg").tag
answer = TwentyBN.image("/path/to/an/image.jpg").ask("What is the man doing?")
```

## Configure Rails application

If you use Rails, you can add omit the first two lines and add the API key to your environment config file as follows:

```ruby
config.twentybn_api_key = 'PUT_API_KEY_HERE'
```

## License

Copyright (c) 2016 Twenty Billion Neurons GmbH, Berlin, Germany

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
