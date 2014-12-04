require 'spec_helper'

describe 'Should wrap in a JSON function' do
  let(:url) { 'https://api.github.com/repos/cognitive-ryanking/githubapi?callback=foo' }
  let(:headers) { {:accept => '*/*'} }
  let(:response) { RestClient.get(url,headers) }

      it 'should return inside a JSON function' do
        expect(response).to match /foo\({"meta":{.*},"data":{.*}}\)/
      end

end