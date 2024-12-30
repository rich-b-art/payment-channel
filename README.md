# Payment Channel Smart Contract

A trustless payment channel implementation for the Stacks blockchain that enables off-chain transactions with on-chain settlement.

## Overview

This smart contract implements bi-directional payment channels allowing two parties to:

- Conduct multiple transactions off-chain
- Settle final balances on-chain
- Support both cooperative and unilateral channel closures
- Include dispute resolution mechanisms

## Features

- **Channel Creation**: Create new payment channels with initial deposits
- **Channel Funding**: Add funds to existing channels
- **Cooperative Closure**: Close channels with mutual agreement
- **Unilateral Closure**: Close channels with dispute period protection
- **Balance Verification**: Validate channel states and balances
- **Emergency Controls**: Protected withdrawal mechanism for contract owner

## Getting Started

### Prerequisites

- Stacks blockchain environment
- Clarity smart contract support
- Cryptographic signing capability for off-chain messages

### Installation

1. Deploy the contract to the Stacks blockchain
2. Initialize channels between participating parties
3. Begin conducting off-chain transactions

## Usage

### Creating a Channel

```clarity
(contract-call? .payment-channel create-channel
  channel-id
  participant-b
  initial-deposit)
```

### Funding a Channel

```clarity
(contract-call? .payment-channel fund-channel
  channel-id
  participant-b
  additional-funds)
```

### Cooperative Channel Closure

```clarity
(contract-call? .payment-channel close-channel-cooperative
  channel-id
  participant-b
  balance-a
  balance-b
  signature-a
  signature-b)
```

## Security

- Row-level security enabled
- Signature verification for all state changes
- Dispute resolution period for unilateral closures
- Emergency controls with owner-only access
