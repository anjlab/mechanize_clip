require 'spec_helper'

describe MechanizeClip do
  it "downloads url contents to temp file" do
    file = subject.get! 'http://google.com'
    file.content_type.should match("text\/html")
    file.original_filename.should == "index.html"
    file.should_not be_nil
  end

  it "downloads images" do
    file = subject.get! 'http://img.yandex.net/i/www/logo.png'
    file.original_filename.should == "logo.png"
    file.content_type.should == "image/png"

    File.size(file.path).should > 0
  end

  it "downloads files from https" do
    file = subject.get! 'https://img.yandex.net/i/www/logo.png'
    file.original_filename.should == "logo.png"
  end

  it "follows redirects" do
    file = subject.get! "http://bit.ly/cHbjf"
    file.original_filename.should == "logo.png"
  end

  it "detects file names" do
    file = subject.get! "https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7@4x-hover.png?1324325376"
    file.original_filename.should == "logov7@4x-hover.png"
  end
end