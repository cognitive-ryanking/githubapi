require 'spec_helper'


describe 'Returns dates in ISO 8061 format' do
  def is_iso8061_valid(date_string)
     !!(date_string =~ /^([0-9]{4})-?(1[0-2]|0[1-9])-?(3[01]|0[1-9]|[12][0-9])T(2[0-3]|[01][0-9]):?([0-5][0-9]):?([0-5][0-9])Z$/)
  end

  let(:url) { 'https://api.github.com/repos/cognitive-ryanking/githubapi' }
  let(:headers) { {:accept => '*/*'} }
  let(:response) { RestClient.get(url,headers) }
  let(:json) {JSON.parse(response)}

  it 'should do something' do
    expect(is_iso8061_valid(json["created_at"])).to be true
    expect(is_iso8061_valid(json["updated_at"])).to be true
    expect(is_iso8061_valid(json["pushed_at"])).to be true
  end
end