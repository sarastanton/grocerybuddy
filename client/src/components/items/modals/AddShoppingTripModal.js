import React from 'react';

const AddShoppingTripModal = (props) => {

  const submitFile = event => {
    const csv = document.getElementById('inputGroupFile01').files[0];
    if (!!csv) {
      let fileData = new FormData();
      fileData.append('file', csv);

      fetch("https://saras-grocery-buddy.herokuapp.com/api/csv_upload", {
        method: "POST",
        body: fileData
      })
      .then((response) => {
        return response.json();
      })
    } else {
      console.log ("Empty file submission")
    }
    props.toggleReload(true);
  }

  const updateFilename = () => {
    if (document.getElementById('inputGroupFile01').files[0]) {
      document.querySelector("label[for=inputGroupFile01]").textContent = document.getElementById('inputGroupFile01').files[0].name;
    }
  }

  return(
    <div className="modal fade" id="add-shopping-trip-modal" tabIndex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div className="modal-dialog modal-dialog-centered" role="document">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title" id="exampleModalCenterTitle">Upload shopping trip data</h5>
            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div className="modal-body">
          <p> Note - file must be CSV format.
          <a href="/upload_template.csv" download>Download file template</a> </p>
            <div className="input-group mb-3">
              <div className="input-group-prepend">
                <span className="input-group-text" id="inputGroupFileAddon01">Upload file</span>
              </div>
              <div className="custom-file">
                <input type="file" className="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" onChange={updateFilename}/>
                <label className="custom-file-label" for="inputGroupFile01">Choose file</label>
              </div>
            </div>
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-outline-secondary" data-dismiss="modal">Close</button>
            <button type="button" onClick={submitFile} className="btn btn-primary" data-dismiss="modal">Save changes</button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default AddShoppingTripModal;
