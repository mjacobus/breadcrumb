# encoding: utf-8

require "spec_helper"
require "breadcrumb/helper"

describe "Breadcrumb::Helper" do
  
  subject { Breadcrumb::Helper.new }
  
  it { should respond_to(:parts) }
  its(:parts) { should eq([]) }
  
  describe "#add" do
    subject { Breadcrumb::Helper.new }
    before { subject.add "Label", "url" }
    its (:parts) {should == [["Label", "url"]]}
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
  
  describe "#separator" do
    subject { Breadcrumb::Helper.new }
    before { subject.separator = '>' }
    its(:separator) { should eq('>') }
  end
  
  describe "#title_separator" do
    subject { Breadcrumb::Helper.new }
    before { subject.title_separator = '>' }
    its(:title_separator) { should eq('>') }
  end
  
  describe "#titleize" do
    subject { Breadcrumb::Helper.new }
    before do
      subject.add 'Home','/'
      subject.add 'News','/news'
      subject.add 'The Last News','news/the-last-news'
    end
    
    context "with no block" do
      its(:titleize){ should eq('Home :: News :: The Last News') }
    end
    
    context "with block given" do
      it "should change titleize" do
        subject.titleize do |part|
          if part == 'Home'
            'Example.com'
          end
        end.should eq('Example.com :: News :: The Last News')
      end
      
      it "should get title from return" do
        subject.titleize do |part, order|
          if order == 0
            'Example.com'
          end
        end.should eq('Example.com :: News :: The Last News')
      end
      
      it "should ignore false block return" do
        subject.titleize {|part, order| false if order == 0}.should eq('News :: The Last News')
      end
    end
  end
  
  describe "#prepend" do
    subject { Breadcrumb::Helper.new }
    before do
      subject.add     'Three','/three'
      subject.prepend 'Two','/two'
      subject.prepend 'One','/one'
    end
    
    its(:parts) { should eq([['One','/one'],['Two','/two'],['Three','/three']]) }
  end
end
