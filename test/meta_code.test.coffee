assert = require 'assert'
metaCode = require '../index'

# test the metacode tool importer
exports.metaCodeToolImporter = ->
  class C
    metaCode @, 'forward'
  assert.ok C.forward

# test the metacode tool autoload
exports.metaCodeToolAutoload = ->
  assert.eql metaCode.extractOptions, require('../tools/extract_options')

