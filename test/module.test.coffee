assert = require 'assert'
metaCode = require '../index'


# test for extend with one source
exports.extend_with_one_source = ->
  source =
    property1: 'property one',
    method1: -> 'method one'
  
  class C
    metaCode @, 'module'
    @extend source
    
  assert.equal C.property1, 'property one'
  assert.equal C.method1(), 'method one'


# test for extend with two sources
exports.extend_with_two_sources = ->
  source = 
    property1: 'property one',
    method1: -> 'method one'
  
  another_source =
    property1: 'property two',      #this will overwrite property1 from source
    method1: -> 'method one'

  class C
    metaCode @, 'module'
    @extend source, another_source
    
  assert.equal C.property1, 'property two'
  assert.equal C.method1(), 'method one'


# test include
exports.include = ->
  source = 
    property1: 'property one',
    method1: -> 'method one'
  
  class C
    metaCode @, 'module'
    @include source

  c = new C()  
  assert.equal c.property1, 'property one'
  assert.equal c.method1(), 'method one'


# test includeInter with only one object to include in prototype chain
exports.include_inter_with_one_source = ->
  source =
    property1: 'property one'
    method1: -> 'method one'

  class C
    metaCode @, 'module'
    @includeInter source

  c = new C()
  assert.equal c.property1, 'property one'
  assert.equal c.method1(), 'method one'


# test includeInter with two objects to include in prototype chain
exports.include_inter_with_two_sources = ->
  source =
    property1: 'property one'
    method1: -> 'method one'

  another_source =
    method1: -> 'overwritten method'
    
  class C
    metaCode @, 'module'
    @includeInter source, another_source

  c = new C()
  assert.equal c.property1, 'property one'
  assert.equal c.method1(), 'overwritten method'

