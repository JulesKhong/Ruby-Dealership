require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('loads the home page',{:type => :feature}) do
  it("shows the home page when the site loads") do
    visit('/')
    expect(page).to have_content('perfect')
  end
end

describe('loads the sell your vehicle' , {:type => :feature}) do
  it('shows the sell page when you click on the sell button') do
    visit('/')
    click_button('Sell your vehicle')
    expect(page).to have_content('Submit')
  end
end

describe('posting a vehicle to the sell page', {:type => :feature}) do
  it('takes the user to a success page once they have completed the sell form') do
    visit('/')
    click_button('Sell your vehicle')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Prius')
    fill_in('year', :with => '2000')
    fill_in('color', :with => 'blue')
    fill_in('engine_size', :with => '4L')
    fill_in('number_of_doors', :with => '4')
    click_button('Submit')
    expect(page).to have_content('Success!')
  end
end

describe('visit vehicle inventory page', {:type => :feature}) do
  it('displays vehicle inventory') do
    visit('/')
    click_button('Sell your vehicle')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Prius')
    fill_in('year', :with => '2000')
    fill_in('color', :with => 'blue')
    fill_in('engine_size', :with => '4L')
    fill_in('number_of_doors', :with => '4')
    click_button('Submit')
    visit('/vehicles')
    expect(page).to have_content('Toyota')
  end
end
