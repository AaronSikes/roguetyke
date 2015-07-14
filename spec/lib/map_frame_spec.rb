require_relative '../../lib/map_frame.rb'

describe MapFrame do
  let(:frame) { Box.new width: 50, height: 100 }
  let(:map) { Box.new width: 200, height: 200 }
  let(:map_frame) { MapFrame.new top: 0, left: 0, frame: frame, map: map }

  it 'starts in the upper left corner' do
    map_frame.dimensions.should eq [0,0,0,0,100,50]
  end

  
  it 'scrolls right' do
    map_frame.scroll_right
    map_frame.x.should eq 1
  end

  it 'scrolls left' do
    map_frame.x = 10
    map_frame.scroll_left
    map_frame.x.should eq 9
  end

  it 'scrolls down' do
    map_frame.scroll_down
    map_frame.y.should eq 1
  end

  it 'scrolls up' do
    map_frame.y = 10
    map_frame.scroll_up
    map_frame.y.should eq 9
  end

  it 'clamps right edge' do
    map_frame.scroll_right 500
    map_frame.x.should eq 150
  end
  
  it 'clamps the left edge' do
    map_frame.scroll_left 500
    map_frame.x.should eq 0
  end

  it 'clamps the bottom edge' do
    map_frame.scroll_down 500
    map_frame.y.should eq 100
  end

  it 'clamps top edge' do
    map_frame.scroll_up 500
    map_frame.y.should eq 0
  end

  it 'returns dimensions correctly' do #refresh(pad_minrow, pad_mincol, screen_minrow, screen_mincol, screen_maxrow, screen_maxcol) click to toggle source
    map_frame = MapFrame.new top: 1, left: 2, frame: frame, map: map
    map_frame.x = 10
    map_frame.y = 20
    map_frame.dimensions.should eq [20, 10, 1, 2, 101, 52] 
  end

end
