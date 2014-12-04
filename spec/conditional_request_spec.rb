require 'spec_helper'

describe 'Conditional request returns 304 when not modified' do

  let(:url) { 'https://api.github.com/repos/cognitive-ryanking/githubapi' }
  let(:headers) { {:accept => '*/*'} }
  let(:response) { RestClient.get(url,headers) }
  let(:json) {JSON.parse(response)}

  it 'should return 304' do
    last_modify = response.headers[:last_modified]
    conditional_header = {:accept=>'*/*',:if_modified_since=>last_modify}
    expect { RestClient.get(url,conditional_header) }.to raise_error { |e|
    expect(e.response.code).to eq 304
                                                         }
  end

end