require "docking_station"

describe DockingStation do
	it { is_expected.to respond_to(:release_bike) }

	it { is_expected.to respond_to(:dock).with(1).argument }

	it 'docks bikes' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.dock(bike)).to eq bike
	end

	describe '#release_bike' do
		it 'releases a bike' do
			bike = Bike.new
			expect(bike).to be_working
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises an error when there are no bikes available' do
			expect {subject.release_bike}.to raise_error("No bikes available")
		end
	end

end
