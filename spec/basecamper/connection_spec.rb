require 'spec_helper'

module Basecamper
  describe Connection do

    let(:domain)   { 'dummy.basecamphq.com' }
    let(:user)     { 'dummy' }
    let(:password) { 'secret' }
    let(:token)    { '123456' }

    subject { Connection }

    describe ".token=" do
      it "sets @token to the passed value" do
        subject.token = token
        subject.instance_variable_get(:@token).should == token
      end
    end

    describe ".token" do
      it "returns the value of @token" do
        subject.instance_variable_set(:@token, token)
        subject.token.should == token
      end
    end

    describe ".use_ssl=" do
      it "sets @use_ssl to the passed value" do
        subject.use_ssl = true
        subject.instance_variable_get(:@use_ssl).should be_true
      end
    end


    describe ".use_ssl" do
      it "returns the value of @token" do
        subject.instance_variable_set(:@use_ssl, true)
        subject.use_ssl.should == true
      end
    end

    describe ".user=" do
      it "sets @user to the passed value" do
        subject.user = user
        subject.instance_variable_get(:@user).should == user
      end
    end

    describe ".user" do
      before(:each) do
        subject.instance_variable_set(:@user, user)
      end

      context ".token is present" do
        before(:each) do
          subject.stub(:token).and_return(token)
        end

        it "returns the token" do
          subject.user.should == token
        end
      end

      context ".token is not present" do
        before(:each) do
          subject.stub(:token).and_return(nil)
        end

        it "returns @user" do
          subject.user.should == user
        end
      end
    end

    describe ".password" do
      before(:each) do
        subject.instance_variable_set(:@password, password)
      end

      context ".token is present" do
        before(:each) do
          subject.stub(:token).and_return(token)
        end

        it "returns 'X'" do
          subject.password.should == 'X'
        end
      end

      context ".token is not present" do
        before(:each) do
          subject.stub(:token).and_return(nil)
        end

        it "returns @password" do
          subject.password.should == password
        end
      end
    end

    describe ".domain=" do
      it "sets @domain to the passed value" do
        subject.domain = domain
        subject.instance_variable_get(:@domain).should == domain
      end
    end

    describe ".domain" do
      before(:each) do
        subject.instance_variable_set(:@domain, domain)
      end

      context ".use_ssl is nil" do
        before(:each) do
          subject.stub(:use_ssl).and_return(nil)
        end

        it "returns the domain prepended by 'http://'" do
          subject.domain.should == "http://#{domain}"
        end
      end

      context ".use_ssl is false" do
        before(:each) do
          subject.stub(:use_ssl).and_return(false)
        end

        it "returns the domain prepended by 'http://'" do
          subject.domain.should == "http://#{domain}"
        end
      end

      context ".use_ssl is true" do
        before(:each) do
          subject.stub(:use_ssl).and_return(true)
        end

        it "returns the domain prepended by 'https://'" do
          subject.domain.should == "https://#{domain}"
        end
      end
    end

    describe ".configure" do
      it "yields Basecamper::Connection" do
        subject.configure do |config|
          config.should == Basecamper::Connection
        end
      end
    end
  end
end
