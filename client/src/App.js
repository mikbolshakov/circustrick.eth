import React from "react";
import "./index.css";

function App() {
    function connectMetaMask() {
        alert("connecting soon");
    }

    return (
        <div className="App">
            <div>
                <h1>Welcome to Circus Trick!</h1>
                <h3>
                    The rules are very simple:
                    <ol>
                        <li>
                            Send your money to the circus cashbox and take it
                            back in a minute!
                        </li>
                        <li>
                            For this you will receive a prize - a unique
                            opportunity to mint NFT!
                        </li>
                    </ol>
                    The main thing is not to confuse the circus cashbox with the
                    magician's bottomless cylinder...
                </h3>
                <button onClick={connectMetaMask} className="metamask">
                    Connect MetaMask
                </button>
            </div>
        </div>
    );
}

export default App;
