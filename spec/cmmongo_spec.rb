require 'spec_helper'

require 'cmmongo'

describe "CMMongo" do
  it "calls blocks on booting" do
    they_called = false
    CMMongo.booting do
      they_called = true
    end
    CMMongo.boot
    expect(they_called).to eql(true)
  end

  it "has environment" do
    CMMongo.boot :development
    expect(CMMongo.env).to eql(:development)
  end
  it "defaults to production environment" do
    CMMongo.boot
    expect(CMMongo.env).to eql(:production)
  end
end