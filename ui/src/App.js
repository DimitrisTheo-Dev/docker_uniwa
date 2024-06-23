import React, { useEffect, useState } from "react";
import './App.css';

export default function App() {
    const [data, setData] = useState(null);

    useEffect(() => {
        fetch('http://localhost:5005/')
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.text();
            })
            .then(data => setData({ message: data }))
            .catch(error => {
                console.error('Error:', error);
            });
    }, []);

    return (
        <div className="app-container">
            <header className="app-header">
                <h1>Welcome to Our Website</h1>
            </header>
            <main className="app-main">
                <p>{!data ? "Loading..." : data.message}</p>
            </main>
        </div>
    );
}
