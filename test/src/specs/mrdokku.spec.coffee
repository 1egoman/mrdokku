'use strict';

mrdokku = source("mrdokku")

describe "basic tests", ->
  it "standard async test", (done) ->
    bool = false
    bool.should.be.false

    setTimeout ->
      bool.should.be.false
      bool = true
      bool.should.be.true
    150

    setTimeout ->
      bool.should.be.true
      done()
    300

  it "standard sync test", ->
    data = []
    obj = id: 5, name: 'test'
    data.should.be.empty
    data.push obj
    data.should.have.length 1
    # soft equal
    data[0].should.be.eql obj
    # hard equal
    data[0].should.be.equal obj

  # Now on to a `real` test
  it "mrdokku should be awesome", ->
    mrdokku.should.have.keys 'awesome'
    mrdokku.awesome.should.be.a 'function'
    mrdokku.awesome().should.be.equal 'awesome'