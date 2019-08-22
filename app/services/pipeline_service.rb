module PipelineService

  PIPELINE_API_URL = 'https://api.pipelinedeals.com/api/v3/deals.json'
  PIPELINE_API_KEY = 'G5mZccexXgchNkAYOBlQ'


  class Deals

    attr_reader :url, :error

    def initialize
      @error = nil
      @url = "#{PIPELINE_API_URL}?api_key=#{PIPELINE_API_KEY}"
    end

    def fetch(attrs = nil)
      url = URI(attrs ? "#{@url}&attrs=#{attrs}" : @url)
      puts "Fetching with: #{url}"
      data = JSON.parse(Net::HTTP.get(url))
      @data = data["entries"]
      @data.each {|d| p d['deal_stage']}
    rescue StandardError => e
      @error = "Error fetching Pipeline data: #{e}"
    end

    def data_for_column_chart
      # Create array of hashes containing one key pair with k = Percent and v = dollar value
      chart_data = @data.inject([]) do |r,v|
        v.deep_symbolize_keys!
        # puts "r = #{r}, v = #{v}"
        # r << {id: v[:id], name: v[:name], value: v[:value], percent: v[:deal_stage][:percent], deal_stage_name: v[:deal_stage][:name]}
        r << { make_key(v[:deal_stage][:percent], v[:deal_stage][:name]).to_sym => v[:value].to_f }
      end

      # Sum up values for each key (percent)
      cd = chart_data.inject({}) {|memo, el| memo.merge( el ){|k, old_v, new_v| ((old_v + new_v) / 100).round(2)}}

      # Sort by key name (percent)
      scd = Hash[ cd.sort_by { |k,v| k}]

      # Format for React-vis barchart (array of x,y pairs)
      data_for_chart = []
      scd.each_pair {|k,v| data_for_chart << {y: v, x: k}}
      data_for_chart
    rescue StandardError => e
      @error = "Error formatting Pipeline data for chart: #{e}"
    end
    
    def make_key(pct, name)
      "   #{pct}".reverse[0..2].reverse + "% #{name}"
    end
  end
end