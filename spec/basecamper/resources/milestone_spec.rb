require 'spec_helper'

module Basecamper
  describe Milestone do

    subject         { Milestone }
    let(:milestone) { subject.new }

    describe "belongs to" do
      it "project" do
        milestone.should respond_to(:project)
      end
    end

    describe ".all" do
      it "appends list to the query" do
        subject.should_receive(:find).with(:all, :from => :list, :params => {})
        subject.all(:params => {})
      end
    end
  end
end
