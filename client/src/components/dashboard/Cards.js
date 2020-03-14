import React from 'react';

const ListCard = (props) => {
  const currency = props.title === "Top 5 highest spend items" ? "$" : "";
  return (
    <div className="my-card">
      <h2>{props.title}</h2>
      <h2>
        <ul>
          {props.data.map(item => Object.values(item)).map(a => <li><span className="stand-out">{a[0]}</span> ({currency}{a[1]})</li>)
         }
        </ul>
      </h2>
    </div>
  );
}

const StatCard = (props) => {
  return (
    <div className="my-card">
      <h2>{props.title}</h2>
      <h1 className="stat">{props.data}</h1>
    </div>
  );
}

export { StatCard, ListCard };
