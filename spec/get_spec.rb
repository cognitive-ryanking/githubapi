require 'spec_helper'

describe 'Get From GitHub' do



  let(:url) { 'https://api.github.com/repos/cognitive-ryanking/githubapi' }
  let(:headers) { {:accept => '*/*'} }
  let(:response) { RestClient.get(url,headers) }

  it 'should get from the GitHub repository' do
    expect(response.code).to eq 200
  end

  it 'should get the following headers' do
    expect(response.headers).to have_key :server
    expect(response.headers).to have_key :date
    expect(response.headers).to have_key :content_type
    expect(response.headers).to have_key :status
    expect(response.headers).to have_key :etag
    expect(response.headers).to have_key :x_github_media_type
    expect(response.headers).to have_key :x_ratelimit_limit
    expect(response.headers).to have_key :x_ratelimit_remaining
    expect(response.headers).to have_key :x_ratelimit_reset
    expect(response.headers).to have_key :cache_control
    expect(response.headers).to have_key :x_content_type_options
  end

  it 'should get proper headers from GitHub' do

    expect(response.headers[:server]).to eq 'GitHub.com'
    expect(response.headers[:content_type]).to eq 'application/json; charset=utf-8'
    expect(response.headers[:status]).to eq '200 OK'
    expect(response.headers[:x_github_media_type]).to eq 'github.v3'
    expect(response.headers[:x_ratelimit_limit]).to eq '60'
    expect(response.headers[:x_content_type_options]).to eq 'nosniff'
  end

end