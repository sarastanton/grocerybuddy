import React, { useState, useEffect } from 'react';
import { StatCard, ListCard } from './Cards'

const Dashboard = () => {
  const [stats, setStats] = useState([999]);

  useEffect(() => {
    const fetchStats = async () => {
      try {
        const stats = await fetch(`https://saras-grocery-buddy.herokuapp.com/api/stats`)
        .then((response) => {
          return response.json();
        });
        setStats(stats.data);
      } catch(e) {
        console.log(e);
      }
    };
    fetchStats();
  }, []);

    if (!stats) {
      return (
        <div class="alert alert-danger" role="alert">
          Something went wrong - please try again
        </div>
      )
    } else {
      return (
        <div className="dashboard-container">
          {stats.map(stat => {
            if (stat.type === "list") {
              return <ListCard title={stat.title} data={stat.data} />
            } else {
              return <StatCard title={stat.title} type={stat.type} data={stat.data} />
            }
          })}
        </div>
      )
    }

}

export default Dashboard;
