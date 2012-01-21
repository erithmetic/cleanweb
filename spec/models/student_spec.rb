require 'spec_helper'
require 'paperclip/matchers'

describe Student do
  describe '#avatar' do
    include Paperclip::Shoulda::Matchers

    it 'uses a facebook avatar if available' do
      u = Student.new :facebook_avatar_url => 'http://facebook.com/me.jpg'
      u.avatar.url.should == 'http://facebook.com/me.jpg'
    end
    it 'uses a gravatar if available' do
      u = Student.new :email => 'me@example.com'
      u.avatar.url.should =~ /gravatar/
    end
    it 'uses an uploaded image if available' do
      u = Student.new :avatar => File.new(File.join(Rails.root, 'app', 'assets', 'images', 'rails.png'))
      u.avatar.url.should =~ /rails/
    end
    it 'defaults to a lame avatar' do
      u = Student.new
      u.avatar.url.should =~ /default/
    end
  end
end

