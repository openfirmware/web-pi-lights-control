# web-pi-lights-control

A web interface for controlling a specific set of Christmas lights from a Raspberry Pi.

This web app is part of [a series of blog posts on controlling Christmas lights from Arduino and Raspberry Pi devices](https://www.jamesbadger.ca/2016/11/04/arduino-christmas-lights-controller/).

## Usage

This is a Sinatra Ruby application that provides a control web page and a bare-bones REST API for controlling the lights using my [pi-lights-control](https://github.com/openfirmware/pi-lights-control) gem.

Start by installing Ruby, preferably 2.1 or newer. I have Ruby 2.1.5 installed on my Pi, so that is why I chose it as the minimum version.

Then install Ruby Gems, the Ruby package manager. With gem, install bundler:

    $ gem install bundler

Sudo may be necessary if you have a system Ruby:

    $ sudo gem install bundler

Then either download an archive of this repo or clone it using git, and install the required gems:

    $ git clone <REPO URL>
    $ cd web-pi-lights-control
    $ bundle install

Now you should be able to run the app in the foreground:

    $ ruby app.rb

The app will then be accessible on the Pi's IP on port 4567.

## License

MIT License

## Authors

James Badger
