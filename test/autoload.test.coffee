assert = require 'assert'
metaCode = require '../index'

# test the forward tool
exports.autoload = ->
  class C
    metaCode @, 'autoload'
    @autoload 'sample_module', __dirname + '/autoload/sample_module'
  assert.equal C.sample_module, 1

