require 'spec_helper'
require 'cmmongo/bus'

describe CMMongo::Bus do

  it "should execute handler for given command" do
    bus = CMMongo::Bus.new
    command = TestFoundCommand.new

    expect { bus.dispatch command }.to raise_error(TestFoundHandler::WereCalled)
  end

  it "should raise a MissingHandler exception when no command handler is found" do
    bus = CMMongo::Bus.new
    command = TestNotFoundCommand.new

    expect { bus.dispatch command }.to raise_error(CMMongo::MissingHandler)
    
  end

end

class TestFoundCommand; end
class TestFoundHandler
  class WereCalled < StandardError; end
  def handle command
    raise WereCalled
  end
end

class TestNotFoundCommand; end
