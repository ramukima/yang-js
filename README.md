# yang-js

YANG parser and composer

Super light-weight and fast. Produces adaptive JS objects bound by
YANG schema expressions according to
[RFC 6020](http://tools.ietf.org/html/rfc6020)
specifications. Composes dynamic YANG schema expressions by analyzing
arbitrary JS objects.

  [![NPM Version][npm-image]][npm-url]
  [![NPM Downloads][downloads-image]][downloads-url]

```coffeescript
Yang = require 'yang-js'
schema = """
  container foo {
    leaf a { type string; }
    leaf b { type uint8; }
  }
  """
model = (Yang schema) {
  foo:
    a: 'apple'
    b: 10
}
model.on 'update', (x) -> # do something with 'x'
```

## Installation

```bash
$ npm install yang-js
```

When using with the web browser, grab the *minified* build inside
`dist/yang.min.js` (currently **~95KB**).

## Features

* Robust parsing
* Focus on high performance
* Extensive test coverage
* Flexible control logic binding
* Powerful XPATH expressions
* Isomorphic runtime
* Adaptive validations
* Dynamic schema generation
* Granular event subscriptions

Please note that `yang-js` is not a code-stub generator based on YANG
schema input. It directly embeds YANG schema compliance into ordinary
JS objects as well as generates YANG schema(s) from oridnary JS
objects.

## Quick Start

Here's a quick example for using this module in coffeescript:

```coffeescript
Yang = require 'yang-js'
schema = """
  container foo {
    leaf a { type string; }
    leaf b { type uint8; }
  }
  """
model = Yang.parse(schema).eval {
  foo:
    a: 'apple'
    b: 10
}
```

The example above uses the *explict* long-hand version of using this
module, which uses the [parse](./src/yang.litcoffee#parse-schema)
method to generate the [Yang expression](./src/yang.litcoffee) and
immediately perform an [eval](./src/yang.litcoffee#eval-data-opts)
using the [Yang expression](./src/yang.litcoffee) for the passed-in JS
data object.

Since the above is a common usage pattern sequence, this module also
provides a *cast-style* short-hand version as follows:

```coffeescript
model = (Yang schema) {
  foo:
    a: 'apple'
    b: 10
}
```

It is functionally equivalent to the *explicit* version but provides
cleaner syntactic expression regarding how the data object is being
*cast* with the `Yang` expression to get back a new schema-driven
object.

Once you have the `model` instance, you can directly interact with its
properties and see the schema enforcement and validations in action.

As the above example illustrates, the `yang-js` module takes a
free-form approach when dealing with YANG schema statements. You can
use **any** YANG statement as the top of the expression and
[parse](./src/yang.litcoffee#parse-schema) it to return a
corresponding YANG expression instance. However, only YANG expressions
that represent a data element will
[eval](./src/yang.litcoffee#eval-data-opts) to generate a new
[Model](./src/model.litcoffee) instance.

## Reference Guides

- [Getting Started Guide](./TUTORIAL.md)
- [Using YANG with Express](http://github.com/corenova/yang-express) (external)
- [Coverage Report](./test/yang-compliance-coverage.md)

## API

Below are the list of methods provided by the `yang-js` module. You
can click on each method entry for detailed info on usage.

### Main module
- [parse (schema)](./src/yang.litcoffee#parse-schema)
- [compose (data)](./src/yang.litcoffee#compose-data-opts)
- [resolve (name)](./src/yang.litcoffee#resolve-from-name)
- [require (name)](./src/yang.litcoffee#require-name-opts)
- [register ()](./src/yang.litcoffee#register-opts)

### Yang instance
- [bind (obj)](./src/yang.litcoffee#bind-obj)
- [eval (data)](./src/yang.litcoffee#eval-data-opts)
- [extends (schema)](./src/yang.litcoffee#extends-schema)
- [locate (ypath)](./src/yang.litcoffee#locate-ypath)
- [toString ()](./src/yang.litcoffee#tostring-opts)
- [toObject ()](./src/yang.litcoffee#toobject)

### Model instance
- [on (event)](./src/model.litcoffee#on-event)
- [in (uri)](./src/model.litcoffee#in-uri)
 
## Examples

**Jukebox** is a simple example YANG module extracted from
[RFC 6020](http://tools.ietf.org/html/rfc6020). This example
implementation is included in this repository's [example](./example)
folder and exercised as part of the test suite. It demonstrates use of
the [register](./src/yang.litcoffee#register) and
[require](./src/yang.litcoffee#require-name-opts) facilities for
loading the YANG schema file and binding various control logic
behavior.

 - [YANG Schema](./example/jukebox.yang)
 - [Schema Bindings](./example/jukebox.coffee)

**Promise** is a resource reservation module implemented for
[OPNFV](http://opnfv.org). This example implementation is hosted in a
separate GitHub repository
[opnfv/promise](http://github.com/opnfv/promise) and utilizes
`yang-js` for the complete implementation. It demonstrates use of
multiple YANG data models in modeling complex systems. Please be sure
to [check it out](http://github.com/opnfv/promise) to learn more about
advanced usage of `yang-js`.

## Tests

To run the test suite, first install the dependencies, then run `npm
test`:
```
$ npm install
$ npm test
```

Also refer to [Compliance Report](./test/yang-compliance-coverage.md)
for the latest [RFC 6020](http://tools.ietf.org/html/rfc6020) YANG
specification compliance. There's also **active** effort to support
the latest **YANG 1.1** draft specifications. You can take a look at
the *mocha* test suite in the [test](./test) directory for compliance
coverage unit-tests and other examples.

## License
  [Apache 2.0](LICENSE)

This software is brought to you by
[Corenova Technologies](http://www.corenova.com). We'd love to hear
your feedback.  Please feel free to reach me at <peter@corenova.com>
anytime with questions, suggestions, etc.

[npm-image]: https://img.shields.io/npm/v/yang-js.svg
[npm-url]: https://npmjs.org/package/yang-js
[downloads-image]: https://img.shields.io/npm/dt/yang-js.svg
[downloads-url]: https://npmjs.org/package/yang-js
