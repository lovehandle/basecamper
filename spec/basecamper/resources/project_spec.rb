require 'spec_helper'

module Basecamper
  describe  Project do

    subject       { Project }
    let(:project) { subject.new }

    describe "has_many" do
      it "attachments" do
        project.should respond_to(:attachments)
      end

      it "categories" do
        project.should respond_to(:categories)
      end

      it "companies" do
        project.should respond_to(:companies)
      end

      it "messages" do
        project.should respond_to(:messages)
      end

      it "milestones" do
        project.should respond_to(:milestones)
      end

      it "people" do
        project.should respond_to(:people)
      end

      it "time_entries" do
        project.should respond_to(:time_entries)
      end

      it "todo_lists" do
        project.should respond_to(:todo_lists)
      end
    end

    describe ".count" do
      it "retrieves count" do
        subject.should_receive(:find).with(:one, :from => :count)
        subject.count
      end
    end
  end
end
