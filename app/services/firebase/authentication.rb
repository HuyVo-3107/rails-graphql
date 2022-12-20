require 'rest-client'
module Firebase
  class Authentication
    def initialize
      super
    end

    def sign_up email, password, returnSecureToken: true
      url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=#{api_key}"
      p url
      payload = { email: email, password: password, returnSecureToken: returnSecureToken }
      begin
        response = RestClient.post(url, payload, headers = { "Content-Type": 'application/json' })
        p response
      rescue RestClient::ExceptionWithResponse => err
        err.response
      end
      response
    end

    private

    def api_key
      Settings.firebase_api_key
    end
  end
end
