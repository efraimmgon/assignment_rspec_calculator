require "calculator"

describe Calculator do
  let(:calc) { Calculator.new }

  describe "#initialize" do
    it "is a Calculator" do
      expect(calc).to be_a(Calculator)
    end
  end

  describe "#add" do
    it "adds two positive numbers" do
      expect(calc.add(1,2)).to eq(3)
    end

    it "adds two negative numbers" do
      expect(calc.add(-1, -2)).to eq(-3)
    end

    it "adds two floating point numbers" do
      expect(calc.add(1.5, 2.5)).to eq(4)
    end
  end

  describe "#subtract" do
    it "subtracts the second int from the first" do
      expect(calc.subtract(1,2)).to eq(-1)
    end

    it "subtracts two negative integers" do
      expect(calc.subtract(-1,-2)).to eq(1)
    end

    it "subtracts two floats" do
      expect(calc.subtract(1, 0.5)).to eq(0.5)
    end
  end

  describe "#multiply" do
    it "multiplies two integers" do
      expect(calc.multiply(2,3)).to eq(6)
    end
  end

  describe "#divide" do
    it "divides the first number by the second" do
      expect(calc.divide(10,2)).to eq(5)
    end

    it "raises an ArgumentError if the second number is zero" do
      expect{ calc.divide(10, 0) }.to raise_error(ArgumentError)
    end

    it "returns an integer if there is no remainder" do
      expect(calc.divide(10,2)).to eq(5)
    end

    it "returns a float if there is a remainder" do
      expect(calc.divide(10,3)).to eq(10.0/3.0)
    end
  end

  describe "#pow" do
    it "raises positive numbers to their power" do
      expect(calc.pow(2,4)).to eq(2**4)
    end

    it "raises negative numbers to their power" do
      expect(calc.pow(-2,4)).to eq((-2)**4)
    end
  end

  describe "#sqrt" do
    it "determines square roots for positive numbers" do
      expect(calc.sqrt(25)).to eq(5)
    end

    it "raises errirs for negative inputs" do
      expect{ calc.sqrt(-25) }.to raise_error(ArgumentError)
    end

    it "returns integers for round roots" do
      expect(calc.sqrt(36)).to eq(6)
    end

    it "returns 2-digit decimals for non-round roots" do
      expect(calc.sqrt(2)).to eq(1.41)
    end
  end

  describe "#memory=" do
    before { calc.memory = 1 }

    it "stores an object in memory" do
      expect(calc.memory).to eq(1)
    end

    it "overwrites any previous object in memory" do
      calc.memory = 2
      expect(calc.memory).to eq(2)
    end
  end

  describe "#memory" do
    it "returns the object in memory" do
      calc.memory = 1
      expect(calc.memory).to eq(1)
    end

    it "clears memory when returned" do
      calc.memory = 1
      memory = calc.memory
      expect(calc.memory).to eq(nil)
    end

    it "starts as nil" do
      expect(calc.memory).to eq(nil)
    end
  end

  describe "#stringify" do
    it "turns the output of functions into a string if the stringify \
input is passed to a new calculator" do
      c2 = Calculator.new(true)
      expect(c2.add(1,2)).to eq("3")
    end
  end

end
