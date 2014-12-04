require 'spec_helper'

describe 'Rate Limit allows 60 requests per hour' do

  let(:url) { 'https://api.github.com/repos/cognitive-ryanking/githubapi' }
  let(:headers) { {:accept => '*/*'} }

  it 'Should hit the rate limit, then get 403' do

    expect {response = RestClient.get(url,headers)
            remaining = response.headers[:x_ratelimit_remaining].to_i
            while remaining > 0
              RestClient.get(url,headers)
              remaining=remaining-1
            end
    }.to raise_error { |e|
     expect(e.response.code).to eq 403
     json = JSON.parse(e.response)
     expect(json["message"]).to match /API rate limit exceeded/
   }
  end
end