require 'spec_helper'

module Basecamper
  describe Message do

    subject       { Message }
    let(:message) { subject.new}

    describe ".element_name" do
      it "returns 'post'" do
        subject.element_name.should == 'post'
      end
    end

    describe "belongs to" do
      it "project" do
        message.should respond_to(:project)
      end
    end

    describe ".archived" do
      it "returns archived messages" do
        subject.should_receive(:find).with(:all, :from => :archive, :params => {})
        subject.archived(:params => {})
      end
    end
  end
end
