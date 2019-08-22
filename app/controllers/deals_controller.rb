class DealsController < ApplicationController

  def index
    deals = PipelineService::Deals.new
    deals.fetch('id,name,value,deal_stage')
    @data_for_chart = deals.data_for_column_chart
    render component: 'Deals', props: {data_for_chart: @data_for_chart }
  end

end
