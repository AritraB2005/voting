# voting
# 🗳️ Decentralized Voting System

A secure, transparent, and tamper-proof voting system built on the Ethereum blockchain using Solidity. This smart contract allows an admin to create proposals and registered users to vote on them — all transparently recorded on-chain.

---

## 🚀 Features

- ✅ Admin can create proposals
- ✅ Admin can register voters
- ✅ Registered voters can vote once per proposal
- ✅ Transparent vote tallying
- ✅ Easily deployed via Remix IDE or integrated into DApps

---

## 🧱 Smart Contract Structure

- **Admin Functions**:
  - `registerVoter(address)`: Registers an Ethereum address as a voter
  - `addProposal(string)`: Adds a new proposal for voting

- **Voter Functions**:
  - `vote(uint proposalId)`: Casts a vote for a specific proposal
  - `getProposal(uint proposalId)`: View proposal description and vote count
  - `hasUserVoted(address, uint)`: Check if a voter has already voted

- **Utility Functions**:
  - `isRegistered(address)`: Check if a voter is registered

---

## 🔧 Getting Started

### Prerequisites

- [Remix IDE](https://remix.ethereum.org) or local Solidity environment
- MetaMask (for deploying to testnets or mainnet)

---

## 🧪 Deploying via Remix IDE

1. Open [Remix](https://remix.ethereum.org)
2. Create a new file called `Voting.sol`
3. Paste in the smart contract code
4. Compile using **Solidity compiler** (`^0.8.20`)
5. Go to **Deploy & Run Transactions**
   - Choose **Remix VM** or **Injected Web3 (MetaMask)**
   - Click **Deploy**
6. Interact with the contract under **Deployed Contracts**

---

## 🛡️ Security Notes

- Voters are registered by an admin (centralized step)
- Each voter can vote only once per proposal
- Further improvements can include:
  - Voting deadlines
  - Vote privacy (e.g., zero-knowledge proofs)
  - Token-based voting

---

## 📁 Folder Structure (optional if full project)
![image](https://github.com/user-attachments/assets/f44fcca7-8608-4267-a13c-4f3946df3dd8)

