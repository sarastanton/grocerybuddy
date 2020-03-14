import React, { useState, useEffect } from 'react';
import AddSingleItemModal from './modals/AddSingleItemModal';
import AddShoppingTripModal from './modals/AddShoppingTripModal';

const Table = (props) => {
  const [items, setItems] = useState([]);
  const [reloadData, toggleReload] = useState(false);

  useEffect(() => {
    const fetchItems = async () => {
      try {
        const items = await fetch(`https://saras-grocery-buddy.herokuapp.com/api/items?sort=${props.sort}`)
        .then((response) => {
          return response.json();
        });
        setItems(items);
      } catch(e) {
        console.log(e);
      }
    };
    fetchItems();
    return () => {
      if (reloadData) {
        toggleReload(false);
      }
    }
  }, [props.sort, reloadData]);

  if (!items) {
    return (
      <div class="alert alert-danger" role="alert">
        Something went wrong - please try again
      </div>
    )
  } else {
    return (
      <React.Fragment>
        <AddSingleItemModal items={items} setItems={setItems} toggleReload={toggleReload}/>
        <AddShoppingTripModal items={items} setItems={setItems} toggleReload={toggleReload}/>
        <div className="table-responsive">
        <table className="table table-fixed">
          <thead className="thead-light">
            <tr>
              <th scope="col" className="col-4"> Date </th>
              <th scope="col" className="col-4"> Description </th>
              <th scope="col" className="col-4"> Price </th>
            </tr>
            </thead>
            <tbody>
              {items.map(item =>
                <tr key={item.id}>
                  <td className="col-4"> {item.date} </td>
                  <td className="col-4"> {item.description} </td>
                  <td className="col-4"> ${parseFloat(item.price).toFixed(2)} </td>
                </tr>
              )}
            </tbody>
        </table>
        </div>
      </React.Fragment>
    );

  }

}

export default Table;
