require_relative '../../lib/map_frame.rb'

describe MapFrame do
  let(:frame) { Box.new width: 50, height: 100 }
  let(:map) { Box.new width: 200, height: 200 }
  let(:map_frame) { MapFrame.new top: 0, left: 0, frame: frame, map: map }

  it 'starts in the upper left corner' do
    map_frame.dimensions.should eq [0,0,0,0,100,50]
  end
  
  it 'scrolls right' do
    map_frame.right
    map_frame.x.should eq 1
  end

  it 'scrolls left' do
    map_frame.x = 10
    map_frame.left
    map_frame.x.should eq 9
  end

  it 'scrolls down' do
    map_frame.down
    map_frame.y.should eq 1
  end

  it 'scrolls up' do
    map_frame.y = 10
    map_frame.up
    map_frame.y.should eq 9
  end


  it 'clamps right edge' do
    map_frame.right 500
    map_frame.x.should eq 150
  end
  
  it 'clamps the left edge' do
    map_frame.left 500
    map_frame.x.should eq 0
  end

  it 'clamps the bottom edge' do
    map_frame.down 500
    map_frame.y.should eq 100
  end

  it 'clamps top edge' do
    map_frame.up 500
    map_frame.y.should eq 0
  end

end
