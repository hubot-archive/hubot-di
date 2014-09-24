# Hubot DI.fm

[![Build Status](https://travis-ci.org/hubot-scripts/hubot-di.svg?branch=master)](https://travis-ci.org/hubot-scripts/hubot-di)

A Hubot script that will display currently playing tracks for channels on [Digitally Imported](http://di.fm) radio.

See [`src/di.coffee`](src/di.coffee) for full documentation.

## Installation

Add **hubot-di** to your `package.json` file:

```
"dependencies": {
  "hubot": ">= 2.5.1",
  "hubot-scripts": ">= 2.4.2",
  "hubot-di": ">= 0.0.0"
}
```
Add **hubot-di** to your `external-scripts.json`:

```json
["hubot-di"]
```

Run `npm install hubot-di`, or run `npm install hubot-di --save-dev` to include `hubot-di` into your package.json file.

## Sample Interaction

```
user1>> hubot di me trance
hubot>> Now playing on the Trance channel: Armin van Buuren presents - A State of Trance Episode 679 | Listen to it here: http://di.fm/trance
user1>> hubot di me Vocal Trance
hubot>> Now playing on the Vocal Trance channel: John O Callaghan Feat Sarah Howells - Find Yourself | Listen to it here: http://di.fm/vocaltrance
user1>> hubot di me unknown channel
hubot>> Unable to find channel unknown channel. Try looking through the channel listings page on http://di.fm for channels that are available and try again.
```
