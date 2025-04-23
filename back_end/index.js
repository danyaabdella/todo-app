// require('dotenv').config();
// const app = require("./app"); 
// const connectDB = require('./config/db');

// const port = process.env.PORT || 3000;

// // Connect to MongoDB
// connectDB();

// app.listen(port, '0.0.0.0', () => {
//   console.log(`Server running on http://0.0.0.0:${port}`);
// });

const app = require("./app");
const db = require('./config/db')
const port = 3000;
app.listen(port,()=>{
console.log(`Server Listening on Port
http://localhost:${port}`);
})