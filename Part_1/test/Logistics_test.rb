require 'rspec'
require 'vcr'
require_relative '../src/Logistics'

describe Logistics do
  VCR.configure do |config|
    config.cassette_library_dir = 'vcr_cassettes'
  end

  it 'calculates correct' do
    VCR.use_cassette('Moscow to Krasnodar 1111') do
      expect(Logistics.create_package({ weight: '1', length: '1', width: '1', height: '1', dep_address: 'Moscow',
                                        arr_address: 'Krasnodar' })).to eq(
                                          { weight: 1.0, length: 1.0, width: 1.0,
                                            height: 1.0, distance: 1348, price: 1348 }
                                        )
    end
  end
end
