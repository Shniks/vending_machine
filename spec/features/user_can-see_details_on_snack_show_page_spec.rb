require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit the a snack show page' do

    before do
      owner = Owner.create!(name: 'Big Al')
      machine_1 = owner.machines.create!(location: 'Hollywood')
      machine_2 = owner.machines.create!(location: 'Sunset')
      machine_3 = owner.machines.create!(location: 'La Canada')
      machine_4 = owner.machines.create!(location: 'Arcadia')
      machine_5 = owner.machines.create!(location: 'Downey')
      @snack_1 = Snack.create!(name: 'White Castle Burger', price: 3.50)
      @snack_2 = Snack.create!(name: 'Pop Rocks', price: 1.50)
      @snack_3 = Snack.create!(name: 'Lays Chips', price: 2.75)

      MachineSnack.create!(snack: @snack_1, machine: machine_1)
      MachineSnack.create!(snack: @snack_1, machine: machine_3)
      MachineSnack.create!(snack: @snack_1, machine: machine_5)
      MachineSnack.create!(snack: @snack_2, machine: machine_1)
      MachineSnack.create!(snack: @snack_2, machine: machine_2)
      MachineSnack.create!(snack: @snack_2, machine: machine_3)
      MachineSnack.create!(snack: @snack_2, machine: machine_4)
      MachineSnack.create!(snack: @snack_3, machine: machine_2)
      MachineSnack.create!(snack: @snack_3, machine: machine_3)
      MachineSnack.create!(snack: @snack_3, machine: machine_4)
      MachineSnack.create!(snack: @snack_3, machine: machine_5)
    end

    it 'I see name and price of that snack' do

      visit "/snacks/#{@snack_1.id}"

      expect(page).to have_content('White Castle Burger')
      expect(page).to have_content('Price: $3.50')
    end

    describe 'I see locations of machines that carry snack.' do
      it 'I also see the average price of snacks in those machienes and count of items in each machine' do

        content_1 = '* Hollywood (2 kinds of snacks, average price of $2.50)'
        content_2 = '* Sunset (2 kinds of snacks, average price of $2.13)'
        content_3 = '* La Canada (2 kinds of snacks, average price of $3.13)'
        content_4 = '* Arcadia (2 kinds of snacks, average price of $2.13)'
        content_5 = '* Downey (3 kinds of snacks, average price of $2.58)'

        visit "/snacks/#{@snack_1.id}"

        expect(page).to have_content('White Castle Burger')
        expect(page).to have_content('Price: $3.50')
        expect(page).to have_content('Locations')
        expect(page).to have_content(content_1)
        expect(page).to have_content(content_2)
        expect(page).to have_content(content_3)
        expect(page).to have_content(content_4)
        expect(page).to have_content(content_5)

        visit "/snacks/#{@snack_2.id}"

        expect(page).to have_content('Pop Rocks')
        expect(page).to have_content('Price: $1.50')
        expect(page).to have_content('Locations')
        expect(page).to have_content(content_1)
        expect(page).to have_content(content_2)
        expect(page).to have_content(content_3)
        expect(page).to have_content(content_4)

        visit "/snacks/#{@snack_3.id}"

        expect(page).to have_content('Lays Chips')
        expect(page).to have_content('Price: $2.75')
        expect(page).to have_content('Locations')
        expect(page).to have_content(content_2)
        expect(page).to have_content(content_3)
        expect(page).to have_content(content_4)
        expect(page).to have_content(content_5)
      end
    end

  end
end
