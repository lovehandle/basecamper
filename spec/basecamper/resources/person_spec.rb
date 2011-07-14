require 'spec_helper'

module Basecamper
  describe Person do

    subject      { Person }
    let(:person) { subject.new }

    describe "belongs to" do
      it "project" do
        person.should respond_to(:project)
      end

      it "company" do
        person.should respond_to(:company)
      end
    end

    describe ".me" do
      it "returns the current users information" do
        subject.should_receive(:find).with(:one, :from => '/me.xml')
        subject.me
      end
    end
  end
end
