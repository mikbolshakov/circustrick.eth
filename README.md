# CircusTrick - interesting chance to mint NFT

You need to send fix amount of ether (0.1 Eth) to the circus cashbox and take it back in a minute!
For this you will receive a prize - a unique opportunity to mint NFT!
But there is a small chance that the money from this circus cashbox will disappear :)

## Install
```bash
git clone https://github.com/mikbolshakov/circustrick.eth.git circustrick
cd circustrick
git checkout circustrick
npm install
```

## Run

First, run the local blockchain:
```bash
cd contracts
npx hardhat node
npx hardhat run scripts/deploy.ts --network localhost
```

Then, run the development server and open [localhost:3000](http://localhost:3000) with your browser to see the result:

```bash
cd frontend
npm start
```

After that, connect your metamask to the local blockchain for work with the DApp in the browser:
```bash
open metamask in browser
import account (type "private key")
enter any private key from the local blockchain
change network to Localhost 8545
```

### Development
Want to contribute? Great!

To fix a bug or enhance an existing module, follow these steps:

- Fork the repo
- Create a new branch (`git checkout -b improve-feature`)
- Make the appropriate changes in the files
- Add changes to reflect the changes made
- Commit your changes (`git commit -am 'Improve feature'`)
- Push to the branch (`git push origin improve-feature`)
- Create a Pull Request 

### Bug / Feature Request

If you find a bug (the website couldn't handle the query and / or gave undesired results), kindly open an issue [here](https://github.com/mikbolshakov/circustrick.eth/issues/new) by including your search query and the expected result.

If you'd like to request a new function, feel free to do so by opening an issue [here](https://github.com/mikbolshakov/circustrick.eth/issues/new). Please include sample queries and their corresponding results.


## Built with 

- [React](https://reactjs.org/) - a JavaScript library for building user interfaces.
- [Solidity](https://docs.soliditylang.org/en/v0.8.17/) - object-oriented, high-level language for implementing smart contracts. Smart contracts are programs which govern the behaviour of accounts within the Ethereum state.
- [Hardhat](https://hardhat.org/) - development environment for Ethereum software. It consists of different components for editing, compiling, debugging and deploying your smart contracts and dApps, all of which work together to create a complete development environment.