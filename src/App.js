import './App.css';
import { useState } from 'react';
import { ethers } from 'ethers';
import PomToken from './artifacts/contracts/PomToken.sol/PomToken.json';
const pomTokenAddress = "0x13119b3c54f632ebe515e3cD409383cFeC1ef188";

function App() {

  const [message, setMessage] = useState("")

  async function getBalance() {
    if (typeof window.ethereum !== 'undefined') {
      // to get address of metamask account
      const [account] = await window.ethereum.request({ method: 'eth_requestAccounts' })
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const contract = new ethers.Contract(pomTokenAddress, PomToken.abi, provider)
      const balance = await contract.balanceOf(account);
      setMessage(`Balance: ${balance/(10**18)} tokens`);
    }
  }

  async function mintToken() {
    if (typeof window.ethereum !== 'undefined') {
      // to get address of metamask account
      const [account] = await window.ethereum.request({ method: 'eth_requestAccounts' });
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(pomTokenAddress, PomToken.abi, signer);
      setMessage("Minting in progress...");
      await contract.mintToken(account, 3);
      setMessage("Mint successful!");
    }
  }

  async function burnToken() {
    if (typeof window.ethereum !== 'undefined') {
      // to get address of metamask account
      const [account] = await window.ethereum.request({ method: 'eth_requestAccounts' });
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(pomTokenAddress, PomToken.abi, signer);
      setMessage("Burning in progress...");
      await contract.burnToken(account, 1);
      setMessage("Burn successful!");
    }
  }

  async function checkTotalSupply() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(pomTokenAddress, PomToken.abi, signer);
      const result = await contract.totalSupply();
      setMessage(`Total Supply: ${result/(10**18)} tokens`);
    }
  }


  async function freezeToken() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(pomTokenAddress, PomToken.abi, signer)
      setMessage("Freezing in progress...");
      await contract.freeze();
      setMessage("Freeeze successful!");

    }
  }

  async function unfreezeToken() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(pomTokenAddress, PomToken.abi, signer);
      setMessage("Thawing in progress...");
      await contract.unfreeze();
      setMessage("Unfreeze successful!");
    }
  }

  return (
    <div className="App">
      <header className="App-header">
        <br />
        <button onClick={getBalance}>Get Balance</button>
        <button onClick={checkTotalSupply}>Check Total Supply</button>
        <button onClick={mintToken}>Mint 3 Tokens</button>
        <button onClick={burnToken}>Burn 1 Token</button>
        <button onClick={freezeToken}>Freeze current account</button>
        <button onClick={unfreezeToken}>Unfreeze current account</button>
        <div className='message'>{message}</div>
      </header>
    </div>
  );
}

export default App;
