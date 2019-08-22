
require 'test_helper'

class PipelineServiceTest < ActiveSupport::TestCase
  def setup
    attrs = 'id,name,value,deal_stage'
    stub_request(:get, PipelineService::Deals.deals_url(attrs) ).
      to_return(:body => file_fixture('raw_deals.txt').read)
  end

  test "should return 100 deals" do
    deals = PipelineService::Deals.new
    deal_count = deals.fetch('id,name,value,deal_stage')
    assert_equal 100, deal_count
  end

  test "should get expected chart results" do
    deals = PipelineService::Deals.new
    deal_count = deals.fetch('id,name,value,deal_stage')
    assert_equal deals.data_for_column_chart, expected_result
  end

  def expected_result
    [
      {:y=>288.9, :x=>:"  0% Lost"},
      {:y=>494.54, :x=>:" 10% Qualified"},
      {:y=>755.26, :x=>:" 25% Request for Info"},
      {:y=>204.08, :x=>:" 50% Presentation"},
      {:y=>408.85, :x=>:" 75% Negotiation"},
      {:y=>76.98, :x=>:"100% Won"}
    ]
  end
end