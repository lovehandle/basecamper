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

    describe ".report" do
      it "returns time entry report" do
        subject.should_receive(:find).with(:all, :from => :report, :params => {})
        subject.report(:params => {})
      end
    end
  end
end
