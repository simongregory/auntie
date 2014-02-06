# encoding: utf-8

require File.join(File.dirname(__FILE__), '/../spec_helper')

describe News do
  before(:each) do
    @io = StringIO.new
    @news = News.new(@io)
  end

  after(:each) do
    @news = nil
    @io = nil
  end

  it 'shows the latest headlines' do
    @news.stub(:console_columns).and_return(120)
    @news.stub_chain(:open, :read) { fixture 'news.json' }
    @news.load

    expect(@io.string).to start_with 'BBC News Headlines'
    expect(@io.string).to include "Police say Moscow school gunman has been 'neutralised'"
  end

  it 'explains when it fails' do
    @news.stub_chain(:open, :read).and_return('corrupt { json')

    expect { @news.load }.to raise_error('Unable to download news')
  end

  it 'truncates output to the size of the shell' do
    @news.stub(:console_columns).and_return(80)
    @news.stub_chain(:open, :read) { fixture 'news.json' }

    @news.load

    expect(@io.string).to end_with "in the last quarter. It put\n"
  end
end
