# A set of metaprogramming tools to aid development, inspired by Ruby
# See the documentation for each tool to find out more


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
    tool = require metaCode.loadPath + toolName
    object[method] = tool[method] for own method of tool


# Default load path, can be customized for custom needs or testing
# Example values
#
#     "./tools/"
#     __dirname + "/tools"
#
metaCode.loadPath = "./tools/"


module.exports = metaCode

