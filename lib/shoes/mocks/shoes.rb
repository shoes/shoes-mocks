require 'rspec/mocks'
require_relative 'bootstrap'
require_relative 'mocked_classes'

# mocking the whole Shoes
class Shoes

  RSpec::Mocks.setup(self)

  attr_accessor :elements

  def initialize(&block)
    self.elements = []
    instance_eval(&block) if block_given?
  end

  def self.app(&block)
    @application = new(&block)
  end

  # get the application that was most recently initilized with shoes
  # unfortunately this won't work with multiple Shoes.apps in a program,
  # as we only get the most recent ones (see above)
  def self.application
    @application
  end

  def append(&blk)
    instance_eval &blk if block_given?
  end

  def button(name, &blk)
    self.elements << Button.new(name, &blk)
  end

  def para(text)
    self.elements << Paragraph.new(text)
  end

  def link(text, &blk)
    self.elements << Link.new(text, &blk)
  end

  def alert(text)
    self.elements << Alert.new(text)
  end

end

