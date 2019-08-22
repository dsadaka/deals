import React from "react"
import PropTypes from "prop-types"
import {VerticalBarSeries, XYPlot, XAxis, YAxis, LabelSeries, HorizontalGridLines} from "react-vis/es";
import { numberFormat} from "./utils";

class DealChart extends React.Component {
  render() {
    const data = this.props.data;
    const chartWidth = 960;
    const chartHeight = 500;
    const chartDomain = [0, 1000];
    console.log(data)

    return (
      <XYPlot  xType="ordinal" width={chartWidth} height={chartHeight} yDomain={chartDomain} color={'green'} >
        <HorizontalGridLines />
        <XAxis  />
        <YAxis left={20} right={10} />
        <VerticalBarSeries data={data} />
        <LabelSeries
          data={data.map(obj => {
            return { ...obj, label: numberFormat(obj.y)  }
          })}
          labelAnchorX="middle"
          labelAnchorY="text-after-edge"
        />
      </XYPlot>
    );
  }
}

DealChart.propTypes = {
  data: PropTypes.array
};
export default DealChart


