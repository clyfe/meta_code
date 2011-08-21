# A set of metaprogramming tools to aid development, inspired by Ruby
# See the documentation for each tool to find out more


fs = require 'fs'
lingo = require 'lingo'


# Use this function to enable a set of metacode tools in your class
#
#     class Controller
#       metaCode @, 'forward'
#       @forward 'req', 'param', 'session'
#
#     c = new Controller()
#     c.req = someReq
#     c.param 'x' # forwards call to "req" object
#
# @object {Object} the class (in CoffeeScript sense) to be augmented
# @modules {Strings...} the modules to bring in
# @api public
metaCode = (object, tools...) ->
  for toolName in tools
    tool = require './tools/' + toolName
    object[method] = tool[method] for own method of tool


# Auto-load cache
metaCode.cache = {}


# Auto-load bundled tools with getters.
fs.readdirSync(__dirname + '/tools').forEach (filename) ->
  if /\.(js|coffee)$/.test(filename)
    name = filename.substr 0, filename.lastIndexOf('.')
    property = lingo.camelcase name.replace(/_/g, ' ')
    metaCode.__defineGetter__ property, -> 
      metaCode.cache.name ?= require('./tools/' + name)


module.exports = metaCode

