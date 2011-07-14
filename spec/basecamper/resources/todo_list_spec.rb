require 'spec_helper'

module Basecamper
  describe TodoList do

    subject { TodoList.new }

    describe "belongs to" do
      it "project" do
        subject.should respond_to(:project)
      end
    end

    describe "has many" do
      it "todo_items" do
        subject.should respond_to(:todo_items)
      end
    end
  end
end
