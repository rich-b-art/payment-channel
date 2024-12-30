# API Reference: Payment Channel Smart Contract

## Public Functions

### create-channel

Creates a new payment channel between two participants.

```clarity
(define-public (create-channel
  (channel-id (buff 32))
  (participant-b principal)
  (initial-deposit uint)
) response)
```

#### Parameters

- `channel-id`: Unique identifier for the channel
- `participant-b`: Address of the second participant
- `initial-deposit`: Initial amount to fund the channel

#### Returns

- `(ok true)` on success
- Error code on failure

### fund-channel

Adds funds to an existing channel.

```clarity
(define-public (fund-channel
  (channel-id (buff 32))
  (participant-b principal)
  (additional-funds uint)
) response)
```

#### Parameters

- `channel-id`: Channel identifier
- `participant-b`: Second participant address
- `additional-funds`: Amount to add

#### Returns

- `(ok true)` on success
- Error code on failure

### close-channel-cooperative

Closes a channel with mutual agreement.

```clarity
(define-public (close-channel-cooperative
  (channel-id (buff 32))
  (participant-b principal)
  (balance-a uint)
  (balance-b uint)
  (signature-a (buff 65))
  (signature-b (buff 65))
) response)
```

#### Parameters

- `channel-id`: Channel identifier
- `participant-b`: Second participant address
- `balance-a`: Final balance for participant A
- `balance-b`: Final balance for participant B
- `signature-a`: Signature from participant A
- `signature-b`: Signature from participant B

#### Returns

- `(ok true)` on success
- Error code on failure

## Read-Only Functions

### get-channel-info

Retrieves channel information.

```clarity
(define-read-only (get-channel-info
  (channel-id (buff 32))
  (participant-a principal)
  (participant-b principal)
) (optional {
  total-deposited: uint,
  balance-a: uint,
  balance-b: uint,
  is-open: bool,
  dispute-deadline: uint,
  nonce: uint
}))
```

#### Parameters

- `channel-id`: Channel identifier
- `participant-a`: First participant address
- `participant-b`: Second participant address

#### Returns

- Channel information if found
- None if channel doesn't exist

## Error Codes

| Code | Description        |
| ---- | ------------------ |
| u100 | Not authorized     |
| u101 | Channel exists     |
| u102 | Channel not found  |
| u103 | Insufficient funds |
| u104 | Invalid signature  |
| u105 | Channel closed     |
| u106 | Dispute period     |
| u107 | Invalid input      |
