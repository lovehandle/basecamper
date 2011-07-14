require 'spec_helper'

module Basecamper
  describe Attachment do

    subject { Attachment.new }

    describe "belongs to" do
      it "project" do
        subject.should respond_to(:project)
      end
    end
  end
end
