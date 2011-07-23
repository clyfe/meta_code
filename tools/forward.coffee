# Forward method calls to certain properties.
#
#     class Controller
#       metaCode @, 'forward'
#       @forward 'req', 'param', 'session'
#
# same as
#
#     class Controller
#       param: -> @req.param.apply @req, arguments
#       session: -> @req.session.apply @req, arguments
#
# @object {String} the name of the property to forward calls to
# @methods {Strings...} the methods to be wired
# @api public
forward = (property, methods...) ->
  proto = @::
  for method in methods
    do (method) ->
      proto[method] = -> @[property][method].apply @[property], arguments


exports.forward = forward

