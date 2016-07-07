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
