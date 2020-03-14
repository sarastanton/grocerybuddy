import React from 'react';

const AddSingleItemModal = (props) => {

  const makeNewItem = () => {
    return ({
      date: new Date(document.getElementById("new-item-date").value),
      description: document.getElementById("new-item-description").value,
      price: document.getElementById("new-item-price").value
    })
  }

  const submitForm = event => {
    fetch("https://saras-grocery-buddy.herokuapp.com/api/items", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(
        makeNewItem()
      )
    })
    .then((response) => {
      return response.json();
    })
    props.toggleReload(true);
  };

  return(
    <div className="modal fade" id="add-single-item-modal" tabIndex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div className="modal-dialog modal-dialog-centered" role="document">
        <div className="modal-content">

          <div className="modal-header">
            <h5 className="modal-title" id="exampleModalCenterTitle">Add a single item</h5>
            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>

          <div className="modal-body">

            <form>
            <div className="row">
              <label htmlFor="new-item-date">Date</label>
              <input type="text" className="form-control mb-2 mr-sm-2" id="new-item-date" placeholder="MM-DD-YY" />

              <label for="new-item-description">Description</label>
              <input type="text" className="form-control mb-2 mr-sm-2" id="new-item-description" placeholder="ex: Bananas" />

              <label for="new-item-price">Price</label>
              <input type="text" className="form-control mb-2 mr-sm-2" id="new-item-price" placeholder="ex: 5.99" />
              </div>
            </form>
          </div>

          <div className="modal-footer">
            <button type="button" className="btn btn-outline-secondary" data-dismiss="modal">Close</button>
            <button type="button" onClick={submitForm} className="btn btn-primary" data-dismiss="modal">Save changes</button>
          </div>

        </div>
      </div>
    </div>
  );
}


export default AddSingleItemModal;
