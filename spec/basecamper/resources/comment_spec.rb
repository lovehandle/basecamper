require 'spec_helper'

module Basecamper
  describe Comment do

    subject { Comment.new }

    describe "belongs to" do
      it "message" do
        subject.should respond_to(:message)
      end

      it "milestone" do
        subject.should respond_to(:milestone)
      end

       it "todo_item" do
        subject.should respond_to(:todo_item)
      end
    end
  end
end
