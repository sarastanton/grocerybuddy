import React, { useState } from 'react';
import Table from './Table';
import TableSortToggle from './TableSortToggle';

const Items = () => {

  const [sort, setSort] = useState('date');

  const toggleSort = event => {
    setSort(event.target.value);
  }

  return (
    <div className="items-container">
      <div className="table-container">
        <Table sort={sort} />
      </div>
      <div className="buttons-and-radio">
        <TableSortToggle toggleSort={toggleSort} sort={sort}/>
        <div className="buttons-container">
          <button className="btn btn-primary" type="button" data-toggle="modal" data-target="#add-single-item-modal"> Add single item </button>
          <button className="btn btn-primary" type="button" data-toggle="modal" data-target="#add-shopping-trip-modal"> Add shopping trip </button>
        </div>
      </div>
    </div>
  );
}

export default Items;
