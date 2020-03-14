import React from 'react';
import { NavLink } from 'react-router-dom';

const Header = () => {
  return(
    <div id="header-labels">
      <NavLink to="/dashboard" activeClassName="active"> Dashboard </NavLink>
      <NavLink to="/items" activeClassName="active"> Items </NavLink>
    </div>
  )
}

export default Header;
