;; Title: Payment Channel Smart Contract
;; Summary: A trustless payment channel implementation enabling off-chain transactions with on-chain settlement
;; Description: This contract implements bi-directional payment channels that allow two parties to conduct
;; multiple transactions off-chain and settle the final balance on-chain. It supports both cooperative
;; and unilateral channel closures with dispute resolution mechanisms.

;; Constants
(define-constant CONTRACT-OWNER tx-sender)

;; Error codes
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-CHANNEL-EXISTS (err u101))
(define-constant ERR-CHANNEL-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-INVALID-SIGNATURE (err u104))
(define-constant ERR-CHANNEL-CLOSED (err u105))
(define-constant ERR-DISPUTE-PERIOD (err u106))
(define-constant ERR-INVALID-INPUT (err u107))

;; Data Maps
(define-map payment-channels 
  {
    channel-id: (buff 32),
    participant-a: principal,
    participant-b: principal
  }
  {
    total-deposited: uint,
    balance-a: uint,
    balance-b: uint,
    is-open: bool,
    dispute-deadline: uint,
    nonce: uint
  }
)

;; Input validation functions
(define-private (is-valid-channel-id (channel-id (buff 32)))
  (and 
    (> (len channel-id) u0)
    (<= (len channel-id) u32)
  )
)

(define-private (is-valid-deposit (amount uint))
  (> amount u0)
)

(define-private (is-valid-signature (signature (buff 65)))
  (and 
    (is-eq (len signature) u65)
    true
  )
)

;; Helper functions
(define-private (uint-to-buff (n uint))
  (unwrap-panic (to-consensus-buff? n))
)

(define-private (verify-signature 
  (message (buff 256))
  (signature (buff 65))
  (signer principal)
)
  (if (is-eq tx-sender signer)
    true
    false
  )
)