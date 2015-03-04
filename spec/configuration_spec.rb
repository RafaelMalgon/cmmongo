require 'spec_helper'
require 'cmmongo/configuration'

describe Configuration do

  it "reads a YML file and exposes it as accessors" do
    conf = Configuration.new '../../spec/files/conf'
    expect(conf.str).to eql('test string')
    expect(conf.arr).to be_an_instance_of(Array)
  end
  it "throws an error when trying to access a non existen key" do
    conf = Configuration.new '../../spec/files/conf'
    expect {conf.no_key}.to raise_error(NoMethodError)
  end
  it "gives object access to hashes within the conf" do
    conf = Configuration.new '../../spec/files/conf'
    expect(conf.inner.inner_value).to eql('valid')
  end

end
