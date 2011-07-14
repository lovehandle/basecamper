require 'spec_helper'

module Basecamper
  describe  Project do

    subject { Project.new }

    describe "has_many" do
      it "attachments" do
        subject.should respond_to(:attachments)
      end

      it "categories" do
        subject.should respond_to(:categories)
      end

      it "companies" do
        subject.should respond_to(:companies)
      end

      it "messages" do
        subject.should respond_to(:messages)
      end

      it "milestones" do
        subject.should respond_to(:milestones)
      end

      it "people" do
        subject.should respond_to(:people)
      end

      it "time_entries" do
        subject.should respond_to(:time_entries)
      end
      
      it "todo_lists" do
        subject.should respond_to(:todo_lists)
      end
    end
  end
end
