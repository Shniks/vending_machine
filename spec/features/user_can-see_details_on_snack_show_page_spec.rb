require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit the a snack show page' do
    it 'I see name and price of that snack' do

      owner = Owner.create!(name: 'Big Al')
      machine_1 = owner.machines.create!(location: 'Hollywood')
      machine_2 = owner.machines.create!(location: 'Sunset')
      machine_3 = owner.machines.create!(location: 'La Canada')
      machine_4 = owner.machines.create!(location: 'Arcadia')
      machine_5 = owner.machines.create!(location: 'Downey')
      snack_1 = machine_1.snacks.create!(name: 'White Castle Burger', price: 3.50)
      snack_1 = machine_3.snacks.create!(name: 'White Castle Burger', price: 3.50)
      snack_2 = machine_1.snacks.create!(name: 'Pop Rocks', price: 1.50)
      snack_2 = machine_4.snacks.create!(name: 'Pop Rocks', price: 1.50)
      snack_2 = machine_5.snacks.create!(name: 'Pop Rocks', price: 1.50)
      snack_3 = machine_1.snacks.create!(name: 'Lays Chips', price: 2.75)
      snack_3 = machine_4.snacks.create!(name: 'Lays Chips', price: 2.75)

      visit "/snacks/#{snack_1.id}"

      expect(page).to have_content('White Castle Burger')
      expect(page).to have_content('Price: $3.50')
    end
  end
end
