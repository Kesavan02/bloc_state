const express = require('express');
const sql = require('mssql');
const app = express();

// SQL Server connection configuration
const config = {
  user: 'your_username',
  password: 'your_password',
  server: 'your_server_address', // e.g., localhost or IP address
  database: 'your_database_name',
  options: {
    encrypt: true, // Use this if you're on Windows Azure
    trustServerCertificate: true // Use this if self-signed certificates are in use
  }
};

// Connect to SQL Server
sql.connect(config, err => {
  if (err) console.error(err);
  console.log('Connected to SQL Server');
});

// Define a route to get data from SQL Server
app.get('/data', (req, res) => {
  const request = new sql.Request();
  request.query('SELECT TOP 10 * FROM your_table_name', (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send(err);
    } else {
      res.json(result.recordset);
    }
  });
});

// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
