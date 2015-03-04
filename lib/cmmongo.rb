require "cmmongo/version"
require "cmmongo/database"

module CMMongo
  @@blocks = [

    Proc.new { |env| @@db = DatabaseConnector.new.connection env},
    Proc.new { |env| MongoConnector.new.connection env}

  ]

  def self.booting &block
    (@@blocks ||= []) << block
  end

  def self.boot env = :production
    @@env = env
    @@blocks.each do |block|
      block.call env
    end
  end

  def self.env
    @@env
  end
  def self.db
    @@db
  end
end