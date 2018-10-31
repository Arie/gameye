require 'spec_helper'

describe Gameye do

  it "raises an error when no token is set" do
    Gameye.token = nil
    expect { Gameye.token }.to raise_error(StandardError)
  end
end

