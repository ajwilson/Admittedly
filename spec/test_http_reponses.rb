require 'pry'
require 'minitest/spec'
require 'minitest/autorun'
require 'net/http'

require_relative '../lib/Admittedly.rb'

describe Admittedly, "Test of Admittedly" do
  before do
    uri = 'http://heroku.ajwilson.com/admittedly'
    @client = Net::HTTP.new( uri )
  end

  describe "When saving an admission" do
    it "should receive HTTP Post request" do
      @client.request_post('/save', "This is an admission.").must_be_silent
      @client.request_post('/save', '"keyword", "definition."').must_be_silent
    end
    it "should check for valid key: value pair" do
        @client.request_post('/save', '"this is", "a malformed", "admission"').must_raise Exception
    end
    it "should write value to keystore server" do
        @client.request_post('/save', 'test1: "This is a test"',)
        @client.request_post('/save', 'test2: "This is a test"',)
        @client.request_post('/save', 'test3: "This is a test"',)
        @client.request_post('/save', 'test4: "This is a test"',)
        @client.request_post('/save', 'test5: "This is a test"')

        @client.request_get('/search', 'Test').must_equal( {test1: "This is a test",
                                                            test2: "This is a test",
                                                            test3: "This is a test",
                                                            test4: "This is a test",
                                                            test5: "This is a test"} )
    end
  end

  describe "When searching admisisons" do
    it "should receieve a HTTP Get request" do
      # send request from client; expect confirmation from server http logs
    end
    it "should return fuzzy matches" do
      # post admits from client; get query from client; expect keystore to return json in format:
      # [
      #   [ 98.8, {key: value} ],
      #   [ 98.3, {key: value} ],
      #   [ 91.5, {key: value} ],
      #   [ 70.2, {key: value} ],
      #   [ 66.0, {key: value} ]
      # ]
    end
  end
end