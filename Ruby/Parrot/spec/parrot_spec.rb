require_relative '../lib/parrot'

describe "Parrots" do
  it "gets speed of a European parrot" do
    parrot = EuropeanParrot.new(0, 0, false)
    expect(parrot.speed).to eq(12.0)
  end

  it "gets speed of an African parrot with one coconut" do
    parrot = AfricanParrot.new( 1, 0, false)
    expect(parrot.speed).to eq(3.0)
  end

  it "gets speed of an African parrot with two coconuts" do
    parrot = AfricanParrot.new(2, 0, false)
    expect(parrot.speed).to eq(0.0)
  end

  it "gets speed of an African parrot with no coconuts" do
    parrot = AfricanParrot.new(0, 0, false)
    expect(parrot.speed).to eq(12.0)
  end

  it "gets speed of a nailed Norwegian blue parrot" do
    parrot = NorwegianBlueParrot.new(0, 1.5, true)
    expect(parrot.speed).to eq(0.0)
  end

  it "gets speed of a not nailed Norwegian blue parrot" do
    parrot = NorwegianBlueParrot.new(0, 1.5, false)
    expect(parrot.speed).to eq(18.0)
  end

  it "gets speed of a not nailed Norwegian blue parrot with high voltage" do
    parrot = NorwegianBlueParrot.new(0, 4, false)
    expect(parrot.speed).to eq(24.0)
  end
end
