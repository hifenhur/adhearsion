# encoding: utf-8

require 'spec_helper'

describe Usuario do

  let(:mock_call) { mock 'Call', :to => '1112223333', :from => "2223334444" }
  let(:metadata) { {} }
  subject { Usuario.new(mock_call, metadata) }

  it "should have empty metadata" do
    subject.metadata.should eq({})
  end

end
