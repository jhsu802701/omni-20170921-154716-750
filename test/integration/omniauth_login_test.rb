require 'test_helper'

class OmniauthLoginTest < ActionDispatch::IntegrationTest
  def login_and_logout_fb
    click_on 'Sign in with Facebook'
    assert page.has_text?('Successfully authenticated from Facebook account.')
    click_on 'Logout'
    assert page.has_text?('Signed out successfully.')
  end

  def login_and_logout_google
    click_on 'Sign in with Google'
    assert page.has_text?('Successfully authenticated from Google account.')
    click_on 'Logout'
    assert page.has_text?('Signed out successfully.')
  end

  test 'Can login with Facebook credentials' do
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: 'facebook', uid: '123545', confirmed_at: Time.now,
      info: { last_name: 'Zuckerberg', first_name: 'Mark',
              email: 'mzuckerberg@facebook.com' }
    )
    # From home page
    visit root_path
    login_and_logout_fb

    # From user login page
    visit root_path
    click_on 'Login'
    login_and_logout_fb
  end

  test 'Can login with Google credentials' do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: 'google_oauth2', uid: '123546', confirmed_at: Time.now,
      info: { last_name: 'Brin', first_name: 'Sergey',
              email: 'sbrin@gmail.com' }
    )
    # From home page
    visit root_path
    login_and_logout_google

    # From user login page
    visit root_path
    click_on 'Login'
    login_and_logout_google
  end
end
