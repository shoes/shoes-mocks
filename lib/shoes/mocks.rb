require "shoes/mocks/version"
require 'rspec/mocks'

# mocking the whole Shoes
class Shoes

  RSpec::Mocks.setup(self)
  class Types; end
  class Background; end
  class Border; end
  class Canvas; end
  class Check; end
  class Radio; end
  class EditLine; end
  class EditBox; end
  class Effect; end
  class Image; end
  class ListBox; end
  class Progress; end
  class Shape; end
  class TextBlock; end
  class Text; end

  # All of the classes above are ones that Shoes needs to be just
  # bootstrapped, all the ones below are ones I'm mocking out from
  # the C code. I'm not sure if there's a good distinction...

  class Button
    attr_accessor :text
    def initialize(text, &blk)
      self.text = text
      instance_eval &blk if block_given?
    end
  end

  class Paragraph
    attr_accessor :text
    def initialize(text)
      self.text = text
    end
  end

  class Link
    attr_accessor :text
    attr_accessor :options
    attr_accessor :block

    def initialize(text, opt={}, &blk)
      self.text = text
      self.options = opt
      self.block = blk
    end

  end

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
  # however how common is this?
  def self.application
    @application
  end

  def append(&blk)
    instance_eval &blk if block_given?
  end

  def button(name, &blk)
    self.elements << Button.new(name, &blk)
    puts "I got called with #{name}"
  end

  def para(text)
    self.elements << Paragraph.new(text)
  end

  def link(text, opt={}, &blk)
    self.elements << Link.new(text, opt, &blk)
  end

end

