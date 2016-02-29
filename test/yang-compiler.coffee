should = require 'should'

describe "yang-js", ->
  yang = require '..'

  describe 'load()', ->
    it "should load itself without errors", ->
      yang.load()

    it "should load simple YANG schema string", ->
      yang.load 'module test {}'

    it "should load simple YANG spec object", ->
      yang.load {
        specification:
          test:
            extension:
              foo:
                argument: 'value'
      }

  describe 'preprocess()', ->
    it "should discover new extensions", ->
      out = yang.preprocess """
        module test-preprocess {
          extension hello-1 { argument value; }
          extension hello-2 { status deprecated; }
        }
      """
      out.should.have.property 'schema'
      out.should.have.property 'map'
      out.map.resolve('extension').should.have.properties 'hello-1', 'hello-2'
