const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors({
    origin: 'http://localhost:3000'
}));

app.use(express.json());

app.get("/", (req, res) => {
    res.send("Hello from the backend.");
});

// Start server
const PORT = 5005;
app.listen(PORT, () => {
    console.log(`Server is running on PORT: ${PORT}`);
});