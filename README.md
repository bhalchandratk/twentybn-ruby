# TwentyBN

## Installation

Add this line to your application's Gemfile:

    gem 'twentybn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twentybn

## Usage

To get access to the twentybn vision api:

```ruby
require 'twentybn'

TwentyBN.api_key = 'PUT KEY HERE'

answer = TwentyBN.image("/path/to/an/image.jpg").ask("What is the man doing?")

# e.g. "throwing a frisbee"
```

Enjoy!
