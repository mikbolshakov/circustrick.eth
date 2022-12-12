import React from "react";
import "./index.css";
import { ethers } from "ethers";
import { useState } from "react";

function App() {
    const [userAccount, setUserAccount] = useState("");

    const connectMetaMask = async () => {
        if (window.ethereum) {
            window.ethereum
                .request({
                    method: "eth_requestAccounts",
                })
                .then((account) => {
                    setUserAccount(account[0]);
                });
        } else {
            alert("Need to install MetaMask");
        }
    };

    const playTrick = () => {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const circusTrickAddress = "0x...";
        // const circusTrickAbi = [...];

        const circusTrick = new ethers.Contract(
            circusTrickAddress,
            circusTrickAbi,
            provider
        );
    };

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
                {userAccount ? (
                    <button onClick={playTrick} className="metamask">
                        Let's play!
                    </button>
                ) : (
                    <button onClick={connectMetaMask} className="metamask">
                        Connect MetaMask
                    </button>
                )}
            </div>
        </div>
    );
}

export default App;
