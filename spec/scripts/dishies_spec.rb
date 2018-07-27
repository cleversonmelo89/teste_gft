require 'spec_helper'

describe Dishies do

  context "when received input values" do

    it "should return propely values when period is morning" do
      dishies = Dishies.new().dishies_values("morning,1,2,3")
      expect(dishies).to eq("eggs,toast,coffee")
    end

    it "should return propely values when period is night" do
      dishies = Dishies.new().dishies_values("night,1,2,3,4")
      expect(dishies).to eq("steak,potato,wine,cake")
    end

    it "should return error when period is invalid" do
      dishies = Dishies.new().dishies_values("afternoon,1,2,3")
      expect(dishies).to eq("invalid input period")
    end

    it "should return propely values when number is mixed" do
      dishies = Dishies.new().dishies_values("morning,2,1,3")
      expect(dishies).to eq("eggs,toast,coffee")
    end

    it "should return propely values when period is morning with four coffee and 1 error" do
      dishies = Dishies.new().dishies_values("morning,3,1,2,3,4,3,3")
      expect(dishies).to eq("eggs,toast,coffee(x4),error")
    end

    it "should return propely values when period is night two four potates" do
      dishies = Dishies.new().dishies_values("night,1,2,3,4,2")
      expect(dishies).to eq("steak,potato(x2),wine,cake")
    end

    it "should return error when has more then 1 dish when the number dish is differenf of 3 and perior morning" do
      dishies = Dishies.new().dishies_values("morning,1,2,3,4,2,2")
      expect(dishies).to eq("Houve um erro: existe mais que 1 prato igual, somente coffee (3) pode ter mais que 1")
    end

    it "should return error when has more then 1 dish when the number dish is differenf of 2 and period night" do
      dishies = Dishies.new().dishies_values("night,1,2,3,3,4,2,2")
      expect(dishies).to eq("Houve um erro: existe mais que 1 prato ou bebida igual, somente potato (2) pode ter mais que 1")
    end

    it "should return propely values with error when has invalid numbers" do
      dishies = Dishies.new().dishies_values("night,1,2,3,4,6")
      expect(dishies).to eq("steak,potato,wine,cake,error")
    end

    it "should return error when has 2 periods" do
      dishies = Dishies.new().dishies_values("night,1,2,3,4,6, morning")
      expect(dishies).to eq("Sua entrada deve conter apenas 1 periodo")
    end
  end

end