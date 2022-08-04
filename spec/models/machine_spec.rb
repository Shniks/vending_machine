require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  it 'it computes the average price of snacks' do
    owner = Owner.create!(name: 'Big Al')
    machine = owner.machines.create!(location: 'Hollywood')
    snack_1 = machine.snacks.create!(name: 'White Castle Burger', price: 3.50)
    snack_2 = machine.snacks.create!(name: 'Pop Rocks', price: 1.50)
    snack_3 = machine.snacks.create!(name: 'Flaming Hot Cheetos', price: 2.50)
    snack_4 = machine.snacks.create!(name: 'Doritos', price: 8.00)
    snack_5 = machine.snacks.create!(name: 'Cheese', price: 6.25)

    expect(machine.average_price).to eq(4.35)
  end
end
