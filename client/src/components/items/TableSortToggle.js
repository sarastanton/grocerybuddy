import React from 'react';

const TableSortToggle = (props) => {

  return (
    <div className="radio-container">
      <div className="form-check form-check-inline">
        <input
          className="form-check-input"
          type="radio"
          name="inlineRadioOptions"
          id="inlineRadio1"
          value="date"
          onChange={props.toggleSort}
          checked={props.sort === "date"}
        />
        <label className="form-check-label" for="inlineRadio1">By Date</label>
      </div>
      <div className="form-check form-check-inline">
        <input
          className="form-check-input"
          type="radio"
          name="inlineRadioOptions"
          id="inlineRadio2"
          value="description"
          onChange={props.toggleSort}
          checked={props.sort === "description"}
        />
        <label className="form-check-label" for="inlineRadio2">By Item</label>
      </div>
    </div>
  );
}

export default TableSortToggle;
