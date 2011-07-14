require 'spec_helper'

module Basecamper
  describe Company do

    subject { Company.new }

    describe "belongs to" do
      it "project" do
        subject.should respond_to(:project)
      end
    end
  end
end
