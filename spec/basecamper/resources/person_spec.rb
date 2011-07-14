require 'spec_helper'

module Basecamper
  describe Person do

    subject { Person.new }

    describe "belongs to" do
      it "project" do
        subject.should respond_to(:project)
      end

      it "company" do
        subject.should respond_to(:company)
      end
    end
  end
end
