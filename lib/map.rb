class Map
  def initialize(image)
    @image = image
  end

  def width
    @width ||= @image[0].length
  end

  def height
    @height ||= @image.length
  end

  def create_pad
    pad = Pad.new height, width
    @image.each do |line|
      pad.addstr line
    end

    pad
  end

end
