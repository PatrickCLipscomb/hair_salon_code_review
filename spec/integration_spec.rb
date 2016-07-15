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
    visit('/add_new_clients')
    click_link('See Unassigned Clients')
    expect(page).to have_content('No currently unassigned clients')
  end
end
