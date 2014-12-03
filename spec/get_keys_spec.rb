require 'spec_helper'

describe 'Verify all Keys from GitHub API endpoint' do

  let(:url) { 'https://api.github.com/repos/cognitive-ryanking/githubapi' }
  let(:headers) { {:accept => '*/*'} }
  let(:response) { RestClient.get(url,headers) }
  let(:json) {JSON.parse(response)}

  it 'should get the following keys' do
    expect(json).to have_key 'id'
    expect(json).to have_key 'owner'
    expect(json).to have_key 'name'
    expect(json).to have_key 'full_name'
    expect(json).to have_key 'description'
    expect(json).to have_key 'private'
    expect(json).to have_key 'fork'
    expect(json).to have_key 'url'
    expect(json).to have_key 'html_url'
    expect(json).to have_key 'clone_url'
    expect(json).to have_key 'git_url'
    expect(json).to have_key 'ssh_url'
    expect(json).to have_key 'svn_url'
    expect(json).to have_key 'mirror_url'
    expect(json).to have_key 'homepage'
    expect(json).to have_key 'language'
    expect(json).to have_key 'forks_count'
    expect(json).to have_key 'stargazers_count'
    expect(json).to have_key 'watchers_count'
    expect(json).to have_key 'size'
    expect(json).to have_key 'default_branch'
    expect(json).to have_key 'open_issues_count'
    expect(json).to have_key 'has_issues'
    expect(json).to have_key 'has_wiki'
    expect(json).to have_key 'has_pages'
    expect(json).to have_key 'has_downloads'
    expect(json).to have_key 'pushed_at'
    expect(json).to have_key 'created_at'
    expect(json).to have_key 'updated_at'
    expect(json).to have_key 'subscribers_count'

    # The following will only exist if this is a fork
    # expect(json).to have_key 'parent'
    # expect(json).to have_key 'source'
  end
end