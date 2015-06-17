# dokku stuff
shell = require "shelljs"

exports.hostname = shell.exec("cat #{process.env.DOKKU_ROOT or 'dokku'}/HOSTNAME").output

exports.getAllRepos = ->
  repos = shell.exec("ls #{process.env.DOKKU_ROOT or 'dokku'}")
  if repos.code is 0
    repos.output.split(' ').map (r) -> exports.getRepoDetails r
  else
    null


exports.getRepoDetails = (repo) ->
  name: repo

