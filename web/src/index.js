import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import { Socket } from "phoenix"
import reportWebVitals from './reportWebVitals';

let socket = new Socket("/socket", { params: { token: window.userToken } })
socket.connect()

let channel = socket.channel("room:lobby", {})
channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
