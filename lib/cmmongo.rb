require "cmmongo/version"

module CMMongo
  @@blocks = []
  def self.booting &block
    (@@blocks ||= []) << block
  end

  def self.boot env = :production
    @@env = env
    @@blocks.each do |block|
      block.call
    end
  end

  def self.env
    @@env
  end
end