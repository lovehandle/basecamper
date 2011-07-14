require 'spec_helper'

module Basecamper
  describe Category do

    subject { Category.new }

    describe "belongs to" do
      it "project" do
        subject.should respond_to(:project)
      end
    end
  end
end
