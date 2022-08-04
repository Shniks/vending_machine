require 'rails_helper'

RSpec.describe 'When a user visits the vending machine show page' do
  scenario 'they see a list of all snacks associated with that machine' do #user story 1

    owner = Owner.create!(name: 'Big Al')
    machine = owner.machines.create!(location: 'Hollywood')
    snack_1 = machine.snacks.create!(name: 'White Castle Burger', price: 3.50)
    snack_2 = machine.snacks.create!(name: 'Pop Rocks', price: 1.50)
    snack_3 = machine.snacks.create!(name: 'Flaming Hot Cheetos', price: 2.50)

    visit "/machines/#{machine.id}"

    expect(page).to have_content('* White Castle Burger: $3.50')
    expect(page).to have_content('* Pop Rocks: $1.50')
    expect(page).to have_content('* Flaming Hot Cheetos: $2.50')
  end

  scenario 'they also see an average price of all snacks in the machine' do #user story 2

    owner = Owner.create!(name: 'Big Al')
    machine = owner.machines.create!(location: 'Hollywood')
    snack_1 = machine.snacks.create!(name: 'White Castle Burger', price: 3.50)
    snack_2 = machine.snacks.create!(name: 'Pop Rocks', price: 1.50)
    snack_3 = machine.snacks.create!(name: 'Flaming Hot Cheetos', price: 2.50)
    snack_4 = machine.snacks.create!(name: 'Cheese', price: 8.50)

    visit "/machines/#{machine.id}"

    expect(page).to have_content('Average Price: $4.00')
  end
end
