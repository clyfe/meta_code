assert = require 'assert'
metaCode = require '../index'

# test the forward tool
exports.forward = ->
  property = 
    method1: -> 'method1'
    method2: -> 'method2'
  class C
    metaCode @, 'forward'
    @forward 'property', 'method1', 'method2'
    constructor: (@property) ->
  c = new C(property)
  assert.equal c.method1(), 'method1'
  assert.equal c.method2(), 'method2'

