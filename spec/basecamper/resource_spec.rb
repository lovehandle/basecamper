require 'spec_helper'

module Basecamper
  describe Resource do

    class Foo < Resource
      child_resources :bars

      def attributes
        {'id' => 123}
      end
    end

    class Bar < Resource
      parent_resources :foo

      def attributes
        {'foo_id' => 456}
      end
    end

    subject { Resource }

    it "inherits from ActiveResource::Base" do
      subject.new.should be_a(ActiveResource::Base)
    end

    describe ".parent_resources" do
      context "Bar" do

        let(:bar_instance) { Bar.new }

        describe "#foo" do
          it "calls Foo.find with its parent id" do
            Foo.should_receive(:find).with(456)
            bar_instance.foo
          end
        end
      end
    end

    describe ".child_resources" do
      context "Foo" do

        let(:foo) { Foo.new }

        describe "#bars" do
          it "calls Bar.all with its parent id" do
            Bar.should_receive(:all).with(:params => {"foo_id" => 123})
            foo.bars
          end
        end
      end
    end

    describe ".find" do

      let(:domain)   { 'https://dummy.basecamphq.com' }
      let(:user)     { 'dummy' }
      let(:password) { 'secret' }

      before(:each) do
        Basecamper::Connection.stub(:domain).and_return(domain)
        Basecamper::Connection.stub(:user).and_return(user)
        Basecamper::Connection.stub(:password).and_return(password)

        subject.stub(:old_find)
      end

      it "sets the site to Connection.domain" do
        subject.should_receive(:site=).with(domain)
        subject.find
      end

      it "sets the user to Connection.user" do
        subject.should_receive(:user=).with(user)
        subject.find
      end

      it "sets the password to Connection.password" do
        subject.should_receive(:password=).with(password)
        subject.find
      end

      it "calls .old_find" do
        subject.should_receive(:old_find).with(:all, {})
        subject.find(:all, {})
      end
    end

    describe ".all" do
      it "aliases find(:all)" do
        subject.should_receive(:find).with(:all, {})
        subject.all({})
      end
    end

    describe ".first" do
      it "aliases find(:first)" do
        subject.should_receive(:find).with(:first, {})
        subject.first({})
      end
    end

    describe ".last" do
      it "aliases find(:last)" do
        subject.should_receive(:find).with(:last, {})
        subject.last({})
      end
    end

    describe ".prefix_source" do
      it "equals '/'" do
        subject.prefix_source.should == '/'
      end
    end
  end
end
