require 'spec_helper'

describe Basecamper do

  subject { Basecamper }

  describe ".account" do
    it "retrieves account information" do
      Basecamper::Resource.should_receive(:find).with(:one, :from => '/account.xml')
      subject.account
    end
  end
end
