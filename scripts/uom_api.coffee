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

    parameters = xxx.mthod(uom)

    host = "#{HOST}"

    path = "/r/#{APIVERSION}/#{API}.json"

    data = ''

    callback = ->
        res.end data

    https.post {host: , path: path}, (res) ->
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
            json = JSON.parse(data)
            console.log "UOM response ", data
            callback()

StartMonitoringHelp = (msg) ->
    txt = "StartMonitoring <IP> <Monitoring ID>"
    msg.send txt
