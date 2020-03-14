import React from 'react';
import { BrowserRouter as Router, Route, Redirect } from 'react-router-dom';
import Header from './components/Header';
import Dashboard from './components/dashboard/Dashboard';
import Items from './components/items/Items';
import './App.css';

const App = () => {
  return (
    <Router>
      <Header/>
      <div className="App">
        <Route path="/dashboard" component={Dashboard} />
        <Route path="/items" component={Items} />
        <Redirect exact from="/" to="/dashboard" />
      </div>
    </Router>
  )
}

export default App;
