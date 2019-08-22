import React from "react";
import PropTypes from "prop-types";
import DealChart from './DealChart';

const divStyle = {
  margin: '10px 0 40px 40px',
  border: '2px solid black'
};

const h1Style = {
  margin: '10px'
}

class Deals extends React.Component {
  render () {
    return (
      <div style={divStyle}>
        <h1 style={h1Style}>Deal Values by Stage (100s)</h1>
        <DealChart data={this.props.data_for_chart} />
      </div>
    );
  }
}

Deals.propTypes = {
  data_for_chart: PropTypes.array
};
export default Deals;
