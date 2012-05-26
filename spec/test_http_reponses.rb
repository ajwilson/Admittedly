require 'pry'
require 'minitest/spec'
require 'minitest/autorun'

before do
  # expect server to be running
  # initialize client
end

describe "When saving an admission" do
  it "should recieve HTTP Post request" do
    # send request from client, set expectation on sinatra http logs
  end
  it "should check for valid key: value pair" do
    # use regexp syntax to check formatting; set expectation on regexp match
  end
  it "should write value to keystore server" do
    # sent hash to keystore; set expectaton on keystore return value
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