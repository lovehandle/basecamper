require 'spec_helper'

module Basecamper
  describe TimeEntry do

    subject          { TimeEntry }
    let(:time_entry) { subject.new }

    describe "belongs to" do
      it "project" do
        time_entry.should respond_to(:project)
      end

      it "todo_item" do
        time_entry.should respond_to(:todo_item)
      end
    end

    describe ".remote" do
      it "calls remote" do
        subject.should_receive(:all).with(:from => :remote, :params => {})
        subject.remote(:params => {})
      end
    end
  end
end
