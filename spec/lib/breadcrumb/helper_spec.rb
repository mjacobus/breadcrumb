# encoding: utf-8

require "spec_helper"
require "breadcrumb/helper"

describe "Breadcrumb::Helper" do
  
  subject { Breadcrumb::Helper.new }
  
  it { should respond_to(:parts) }
  it "should respond_to(:titleize)"
  
  
  describe "#add" do
    subject { Breadcrumb::Helper.new }
    before { subject.add "Label", "url", {} }
    its (:parts) {should == [["Label", "url", {}]]}
  end
  
  describe "#to_s" do
    context "with one crumb" do
      subject do
        helper = Breadcrumb::Helper.new
        helper.add "home","/"
        helper
      end
      
      its (:to_s){should == ''}
    end
    
    context "with two crumbs" do
      subject do
        helper = Breadcrumb::Helper.new
        helper.add "Home","/"
        helper.add "News","/news"
        helper
      end
      
      its (:to_s){should == '<div class="breadcrumb"><a href="/">Home</a><span class="separator"> » </span><span>News</span></div>'}
    end
  end

end
