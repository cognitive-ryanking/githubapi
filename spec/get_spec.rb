require 'rspec'
require 'json'
require 'rest_client'

describe 'Get From GitHub' do

  def json(url)
    headers = {:accept => '*/*'}
    JSON.parse(RestClient.get(url, headers))
  end

  let(:url) { 'https://api.github.com/users/cognitive-ryanking/repos' }

  it 'should get from the GitHub repository' do

    json = json(url)
    expect(json).to be_an(Array)
    expect(json.first['name']).to eq 'githubapi'
    expect(json.first['owner']['login']).to eq 'cognitive-ryanking'
  end
end