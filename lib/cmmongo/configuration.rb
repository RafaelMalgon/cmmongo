require 'yaml'

class Configuration

  def initialize name
    @path = File.join(File.dirname(File.expand_path(__FILE__)), "#{name}.yml")
    load
  end

  def method_missing name
    key = name.to_s
    super unless @data.key? key
    @data[key] 
  end

  private
  def load
    @data = YAML.load_file @path
  end

end