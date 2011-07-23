# Forward method calls to certain properties.
#
#     class I18n
#       metaCode @, 'autoload'
#       @autoload 'Backend', 'lib/backend'
#     
#     console.log I18n.Backend
#
# @name {String} the name of the property onto wich we load
# @methods {path} the path to be required
# @api public
autoload = (name, path) ->
  @__defineGetter__ name, -> require path


exports.autoload = autoload

