import React from "react";
import PropTypes from "prop-types";
import DealChart from './DealChart';

const divStyle = {
  margin: '40px',
  border: '5px solid black'
};

class Deals extends React.Component {
  render () {
    return (
      <div style={divStyle}>
        <h1>Deals by Stage (100s)</h1>
        <DealChart data={this.props.data_for_chart} />
      </div>
    );
  }
}

Deals.propTypes = {
  data_for_chart: PropTypes.array
};
export default Deals;
