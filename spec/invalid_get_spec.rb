require 'spec_helper'

describe 'Invalid Requests to Return errors' do

  let(:bad_url) { 'https://api.github.com/repos/cognitive-ryanking/broken' }
  let(:url) {'https://api.github.com/repos/cognitive-ryanking/githubapi' }
  let(:headers) { {:accept => '*/*'} }


  it 'should return bad response' do
    expect{ RestClient.get(bad_url,headers) }.to raise_exception
  end

  it 'should result in a 404 error' do
    begin
      RestClient.get(bad_url,headers)
    rescue => e
      expect(e.response.code).to eq 404
      json = JSON.parse(e.response)
      expect(json["message"]).to eq 'Not Found'
    end
  end

  it 'Cannot put' do
    expect{RestClient.put(url,headers)}.to raise_exception
  end

  it 'Cannot post' do
    expect{RestClient.post(url,headers)}.to raise_exception
  end

  it 'Cannot delete' do
    expect{RestClient.delete(url,headers)}.to raise_exception
  end

  it 'Cannot patch' do
    expect{RestClient.patch(url,headers)}.to raise_exception
  end

  it 'Cannot take a bad header' do
    bad_headers = {:accept => 'fake/fake'}
    begin
      RestClient.get(url,bad_headers)
    rescue => e
      expect(e.response.code).to eq 415
      json = JSON.parse(e.response)
      expect(json["message"]).to match(/Unsupported 'Accept' header/)
    end
  end
end