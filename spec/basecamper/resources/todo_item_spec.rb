require 'spec_helper'

module Basecamper
  describe TodoItem do

    subject { TodoItem.new }

    describe "belongs to" do
      it "todo_list" do
        subject.should respond_to(:todo_list)
      end
    end

    describe "has many" do
      it "time_entries" do
        subject.should respond_to(:time_entries)
      end
    end
  end
end
