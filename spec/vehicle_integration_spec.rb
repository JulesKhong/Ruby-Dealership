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
