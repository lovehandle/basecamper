require 'spec_helper'

describe Basecamper do

  subject { Basecamper }

  describe ".account" do
    it "retrieves account information" do
      Basecamper::Resource.should_receive(:find).with(:one, :from => '/account.xml')
      subject.account
    end
  end

  describe ".configure" do
    it "yields a Basecamper::Connection" do
      Basecamper.configure do |config|
        config.should == Basecamper::Connection
      end
    end
  end
end
