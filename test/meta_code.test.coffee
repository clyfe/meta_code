assert = require 'assert'
metaCode = require '../index'

# test the metacode tool importer
exports.metaCode = ->
  class C
    metaCode @, 'forward'
  assert.ok C.forward

