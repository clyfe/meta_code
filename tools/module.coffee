_ = require 'underscore'


# Copy into object all properties from module
#
#     Macros =
#       delegate: (to, what) -> 
#         @[what] = @[to][what].apply @[to], arguments
#
#     class Application extends Controller
#       metaCode @, 'module'
#       @extend Macros
#       @delegate 'req', 'userId'
#       index: -> console.log @userId()
#
# @objects {Objects...} the objects to extend with
# @api public
extend = (objects...) ->
  for object in objects
    for name, property of object
      @[name] = property


# Copy into object all properties from module onto the prototype
#
#     Authentication =
#       currentUser: (cb) -> 
#         User.find @session('userId'), (err, user) ->
#           user = new User() if err
#           cb(user)
#
#     Authorization =
#       authorize: (role, cb) ->
#         @currentUser (user) ->
#           throw new Error('Not Authorized') unless user.role == role
#           cb()
#
#     class Tweets extends Controller
#       metaCode @, 'module'
#       @include Authentication, Authorization
#       show:
#         @authorize 'admin', =>
#           Tweet.find @params 'id', (@err, @tweet) => @render 'show'
#
# @objects {Objects...} the objects to mix in
# @api public
include = (objects...) ->
  proto = @::
  for object in objects
    for own name, property of object
      proto[name] = property


# The same as "include" only it does not copy the properties, it achieves
# augmentation by injecting copies of module-objects into the receiver's
# prototype chain
#
# @objects {Objects...} the objects to mix in
# @api public
includeInter = (objects...) ->
  for object in objects
    module = _.clone(object)
    previousPrototype = @::
    @:: = module
    module.__proto__ = previousPrototype
    # make sure to preserve the constructor property
    @::constructor = previousPrototype.constructor if previousPrototype.hasOwnProperty 'constructor'


exports.extend = extend
exports.include = include
exports.includeInter = includeInter

