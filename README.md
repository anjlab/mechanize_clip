# MechanizeClip

Downloads files to temp files with Mechanize gem.
You can use it with paperclip.

## Installation

Add this line to your application's Gemfile:

    gem 'mechanize_clip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mechanize_clip

## Usage

```ruby
user.avatar = MechanizeClip.get 'http://www.google.ru/images/nav_logo99.png'

# it follows redirects
user.avatar = MechanizeClip.get 'http://bit.ly/cHbjf'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
