### About

Meta Code is a set of metaprogramming utilities for CoffeeScript (inspired by Ruby).  

Although you can achieve the same things by hard-coding evrything, this package is good 
because function names convey meaning, and is good to have consensus among developers.


### Features

Curently, the folowing tools are provided (nicely documented in the code)

* **module**
  - `extend` - copies the module object's methods onto an object
  - `include` - copies the module object's methods onto an object's prototype
  - `includeInter` - inject a shallow copy of the module object into an object's prototype chain
  
* **forward**
  - `forward` - forward a method call to an object property
  
* **autoload**
  - `autoload` - load a property from a file


### Install

Install with npm:

```shell
# install locally in "./node_modules"
npm install meta_code

# or use -g to install globally
npm install meta_code -g

# or add it as a dependecy to your package.json and run
npm install
```


### Usage

Metacode consists of a series of tools like "forward" or "module" that aid you to inject code in your objects.
There are two interfaces that can be used:

1. Use via `metaCode` helper

```coffeescript
metaCode = require 'meta_code'

# a "module" we'll be including in our class
Power =
  sword: 'katana'
  fight: -> console.log @sword

class Samurai
  # Enable the module tool. Once enabled we can use this tool's methods 
  # like 'extend' and 'include' in our object, because the tool's methods 
  # get copied in our object
  metaCode @, 'module'
  @include Power
```

2. Use directly

```coffeescript
module = require 'meta_code/tools/module' # include the tool

# a "module" we'll be including in our class
Power =
  sword: 'katana'
  fight: -> console.log @sword

class Samurai
  module.include.call @, Power
```

