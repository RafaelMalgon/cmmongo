require 'spec_helper'
require 'cmmongo'

describe "CMMongo" do

  it "connects to the database" do
    CMMongo.boot

    expect(CMMongo.db.test_connection).to be_truthy
  end

  it "connects to a database depending on the environment" do
    skip "can't figure out how to test"
  end
 
end
