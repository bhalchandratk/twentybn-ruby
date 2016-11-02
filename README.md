[![Code Climate](https://codeclimate.com/github/TwentyBN/twentybn-ruby/badges/gpa.svg)](https://codeclimate.com/github/TwentyBN/twentybn-ruby)

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

### Image tagging

Image tagging returns tags for a given image by applying a neural networks based classifier on the image. The basic usage is as follows:

```ruby
require 'twentybn'
TwentyBN.api_key = 'PUT_API_KEY_HERE'
tags = TwentyBN.image("/path/to/an/image.jpg").tag
```

The result will look like this:
```ruby
{
    "result"=> {
        "scores"=> [
            0.6320463418960571,
            0.3534449338912964,
            0.00861052330583334,
            0.001009061117656529,
            0.0009043768513947725
        ],
        "tags"=> [
            "tabby, tabby cat",
            "tiger cat",
            "Egyptian cat",
            "lens cap, lens cover",
            "cup"
        ]
    }
}
```

The default image classifier knows one thousand objects and returns the top 5 most likely results.

### Configure Rails application

If you use Rails, you can add the API key to your environment config file as follows:

```ruby
config.twentybn_api_key = 'PUT_API_KEY_HERE'
```

### Using alternative image classifiers

There are also two alternative image classifiers available, `:categories` and `:places`. You can use them as follows:

```ruby
tags = TwentyBN.image("/path/to/an/image.jpg").tag(:categories)
```

```ruby
tags = TwentyBN.image("/path/to/an/image.jpg").tag(:places)
```

### Roll your own classifier

You can train your own image classifier at https://cortex.twentyn.com under `Applications` -> `Image Tagging` -> `Custom Image Taggers`. Here, you can create a classifier, add class labels to it and upload some example images for each class. Finally, you can click `train` to build your own classifier automatically. As a result, you get a `ModelID` which you can use to access your custom image classifier as follows:

```ruby
tags = TwentyBN.image("/path/to/an/image.jpg").tag("PUT_YOUR_MODEL_ID_HERE")
```

### Visual Question Answering (VQA)

Visual Question Answering means that you can ask a natural language question about a given image. You can use it as follows:

```ruby
answer = TwentyBN.image("/path/to/an/image.jpg").ask("What is the man doing?")
```

The result will look like this:

```ruby
{
    "result"=> {
        "answers"=> [
            "PLAYING FRISBEE",
            "CATCHING FRISBEE",
            "FLYING KITE",
            "FLYING KITES"
            "SKATEBOARDING",
        ],
        "scores"=> [
            9.731609344482422,
            8.681315422058105,
            7.385936737060547,
            7.113564491271973,
            6.711164474487305
        ]
    }
}
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
