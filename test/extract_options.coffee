assert = require 'assert'
metaCode = require '../index'

# test the extract options tool
exports.extractOptions = ->
  assert.eql {}, metaCode.extractOptions []
  assert.eql {}, metaCode.extractOptions [1, 2]
  assert.eql {a: 1, b: 2}, metaCode.extractOptions [1, 2, {a: 1, b: 2}]

