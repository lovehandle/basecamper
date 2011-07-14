require 'spec_helper'

module Basecamper
  describe TimeEntry do

    subject { TimeEntry.new }

    describe "belongs to" do
      it "project" do
        subject.should respond_to(:project)
      end

      it "todo_item" do
        subject.should respond_to(:todo_item)
      end
    end
  end
end
