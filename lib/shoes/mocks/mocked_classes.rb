# The classes mocked out from the C-Code
class Shoes

  class TextElement
    attr_accessor :text
    def initialize(text)
      self.text = text
    end
  end

  # quite an inheritance chain... someone told me inheritance is bad :<
  # But it felt like so much duplication
  class TextBlockElement < TextElement
    attr_accessor :block, :parent
    def initialize(parent, text, &blk)
      super(text)
      self.parent = parent
      self.block = blk
    end

    def click
      parent.instance_eval(&block)
    end

  end

  class Alert < TextElement; end
  class Paragraph < TextElement; end

  class Link < TextBlockElement; end
  class Button < TextBlockElement; end

end

