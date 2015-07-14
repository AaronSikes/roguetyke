require_relative '../../lib/map'

describe Map do
  let(:image) {['xxxx', 'xoox', 'xxxx']}
  let(:map) { Map.new image }

  it 'determines width' do
    map.width.should eq 4
  end

  it 'determines height' do
    map.height.should eq 3
  end
end
