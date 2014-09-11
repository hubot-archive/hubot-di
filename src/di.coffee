# Description:
#   Get currently playing tracks from DI.fm
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   hubot di me <channel> - Returns track information for di.fm channel
#
# Authors:
#   paul91
#   hectorleiva

module.exports = (robot) ->
  robot.respond /di\s+?me?\s+?(.+)/i, (msg) ->
    diMe msg

diMe = (msg) ->
  msg.http('http://listen.di.fm/trance')
    .get() (err, res, body) ->
      try
        found = false
        di_channels = JSON.parse(body)
        di_channels.forEach (element, index) ->
          channel = String(msg.match[1]).replace /\s/g, ''
          re = new RegExp("^#{channel}$", 'i')
          if element["key"].match(re) or element["name"].replace(/\s+/g, '').match(re)
            found = true
            di_fm_station_info =
              channel_id: element["id"]
              channel_key_name: element["key"]
              channel_name: element["name"]
              channel_link: 'http://di.fm/'+element["key"]

            msg.http('http://api.audioaddict.com/v1/di/track_history')
              .get() (err, res, body) ->
                try
                  channel_details = JSON.parse(body)
                  channel_info = channel_details[di_fm_station_info.channel_id]
                  msg.send "Now playing on the #{di_fm_station_info.channel_name} channel: #{channel_info.track} | Listen to it here: #{di_fm_station_info.channel_link}"
                catch
                  msg.send "Unable to get currently playing info for channel: #{di_fm_station_info.channel_name}."
        if !found
          msg.send "Unable to find channel #{msg.match[1]}. Try looking through the channel listings page on http://di.fm for channels that are available and try again."
      catch
        msg.send "Unable to connect to di.fm api. Please try again later."
