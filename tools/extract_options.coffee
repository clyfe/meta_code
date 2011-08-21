# Extracts options from a set of arguments. Removes and returns the last
# element in the array if it's a hash, otherwise returns a blank hash.
#
#     metaCode = require 'meta_code'
#     metaCode.extract_options(1, 2)       # => {}
#     metaCode.extract_options(1, 2, a: 1) # => {a: 1}
#
extract_options = (args) ->
  throw new Error("args must be an Array") unless args instanceof Array
  last = args[args.length - 1]
  if typeof last == 'object' then args.pop() else {}


module.exports = extract_options

