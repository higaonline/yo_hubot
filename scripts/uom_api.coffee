# Description:
#  uom_api bot
#
# Dependencies:
#
# Configuration:
#  
#
# Commands:
#  hubot StopMonitor <IP> <MonitorID>
#  hubot StartMonitor <IP> <MonitorID>
#
# Notes:
#
# Author:
#  s-fukuda

##
## Sample for Hubot develop
##
module.exports = (robot) ->

  robot.hear /hoge/i, (msg) ->
    msg.send 'huga'
    msg.send "@#{msg.message.user.name}, foo bar."
    # reply to @<user>
    msg.reply 'who are you?'

## end

## main

HOST = uom.api.iiji.jp
APIVERSION = 20161003
API = process.argv[2]
TARGET = process.argv[3]
MONITOR_ID = process.argv[4]

module.exports = (robot) => {
  robot.router.get "/uom/StartMonitoring", (req, res) ->
    https = require 'https'

    uom = {}
    uom.gormat = 'json'
    uom.service_code = process.env.IIJ_SERVICE_CODE
    uom.master_id = process.env.IIJ_MASTER_ID

    host = "#{HOST}"
    path = "/r/#{APIVERSION}/#{API}.json"
    data = ''

    callback = ->
        res.end data

    request.post
      url: 'http://#{HOST}/r/#{APIVERSION}/#{API}.json'
      body: 'something'
      headers: {'Content-Type': 'application/json'}
      headers: {'x-iijapi-Expire': '#{IIJAPI_EXPIRE}'}
      headers: {'x-iijapi-SignatureMethod': 'HmacSHA256'}
      headers: {'x-iijapi-SignatureVersion': '2'}
      headers: {'Authorization:IIJAPI': '#{IIJAPI_ACCESS_KEY}:#{SIGN}'}
    , (err, response, body) ->

StartMonitoringHelp = (msg) ->
    txt = "StartMonitoring <IP> <Monitoring ID>"
    msg.send txt
