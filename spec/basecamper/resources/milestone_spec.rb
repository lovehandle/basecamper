require 'spec_helper'

module Basecamper
  describe Milestone do

    subject { Milestone.new }

    describe "belongs to" do
      it "project" do
        subject.should respond_to(:project)
      end
    end
  end
end
