fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

build = (callback) ->
  # coffee --compile --watch --map --output 'js' 'src'
  coffee = spawn 'coffee', ['-c', '-w', '-m', '-o', 'js', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'build', 'Build js/ from src/', ->
  build()