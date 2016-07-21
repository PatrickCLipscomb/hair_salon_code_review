require 'int_spec_helper'

describe('client path', {:type => :feature}) do
  it('renders the client landing page') do
    visit('/')
    expect(page).to have_content("List of your stylists:")
  end

  it('renders the Clients add page') do
    visit('/')
    click_link('Add clients and assign to stylists')
    expect(page).to have_content("List of your clients:")
  end

  it('renders the Stylists add page') do
    visit('/')
    click_link('Add some stylists')
    expect(page).to have_content('List of your stylists:')
  end

  it('reveals the unassigned clients') do
    visit('/clients/new')
    click_link('See Unassigned Clients')
    expect(page).to have_content('No currently unassigned clients')
  end

  it('submits the add new stylist form and refreshes the stylist page') do
    visit('/stylists/new')
    fill_in('create_name', :with => 'fredric')
    click_button('Add Stylist')
    expect(page).to have_content('fredric')
  end

  it('submits the add new client form and refreshes the client page')
end
