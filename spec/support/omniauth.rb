# OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
#   provider: 'linkedin',
#   uid: '123545'
# })
def auth_mock
  OmniAuth.config.mock_auth[:linkedin] = {
    'provider' => 'linkedin',
    'uid' => '123545',
    'info' => {
      'name' => 'mockuser'
    },
    'credentials' => {
      'token' => 'mock_token',
      'secret' => 'mock_secret'
    }
  }
end
OmniAuth.config.test_mode = true
