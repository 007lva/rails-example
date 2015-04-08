require 'spec_helper'

describe Post do
  let!(:post) { Post.create(:name => "Buildkite is great", :body => "Trust me!") }

  it "saves to the database" do
    latest_post = Post.last
    expect(latest_post).to eql(post)
  end

  it "searches post records" do
    index

    found_post = Post.search('buildkite').first
    expect(found_post).to eql(post)
  end
end
