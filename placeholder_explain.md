When preparing an input script for signing in a Bitcoin transaction, a placeholder is used in place of the actual signature and public key. The placeholder is typically referred to as a "blank" or "dummy" signature and public key. The purpose of using placeholders is to create an input script with the correct structure and size before the actual signature and public key are inserted during the signing process.

The input script, also known as the ScriptSig, is an essential part of a Bitcoin transaction's input. It provides the data needed to satisfy the conditions specified in the corresponding output script (ScriptPubKey) of the UTXO being spent. In the case of a typical Pay-to-Public-Key-Hash (P2PKH) transaction, the ScriptSig consists of two main components: the signature and the public key.

Before signing a transaction, the actual signature and public key are not known, as they depend on the private key of the sender. Therefore, a placeholder is used for both the signature and the public key. The placeholder for the signature is usually a fixed-length value with all bytes set to zero (or any other arbitrary value). Similarly, the placeholder for the public key is typically a fixed-length value of known structure, such as the byte that indicates the length of the public key followed by zero bytes.

The use of placeholders ensures that the transaction's size and structure are not affected by the actual signature and public key's length. Once the transaction is ready to be signed, the placeholders are replaced with the real signature and public key generated from the sender's private key.

During the signing process, the transaction data is hashed and then signed using the sender's private key, resulting in a valid signature. The signature is then inserted into the placeholder position in the input script. The corresponding public key is also included in the ScriptSig. Once both the signature and public key are in place, the input script is complete and can be used to verify the transaction's validity during the network's consensus process.

The length of the placeholder in the input script is calculated based on the expected length of the actual signature and public key. For standard Pay-to-Public-Key-Hash (P2PKH) transactions, the lengths of the signature and public key are known in advance and have fixed sizes.

The placeholder for the signature is typically set to a fixed length of 71 bytes, regardless of the actual signature's length. This is because a valid ECDSA signature can have a maximum length of 72 bytes, and using 71 bytes for the placeholder ensures that it can accommodate any possible signature.

The placeholder for the public key is also of fixed length and typically consists of two parts:

1. A single byte that indicates the length of the public key. This byte can have a value from 33 to 65, representing compressed and uncompressed public keys, respectively.

2. The public key itself, which can be either 33 or 65 bytes in length, depending on whether it is compressed or uncompressed.

The total length of the placeholder for the public key is either 34 bytes (for compressed) or 66 bytes (for uncompressed).

To summarize, the length of the placeholder in a standard P2PKH input script is as follows:

- Placeholder for the signature: 71 bytes
- Placeholder for the public key: 34 bytes (compressed) or 66 bytes (uncompressed)

Using fixed-length placeholders ensures that the input script's overall size remains constant, regardless of the actual signature and public key lengths when they are inserted during the signing process. It also helps maintain transaction uniformity and makes transaction verification more efficient.

* For P2PK:
In a Pay-to-Public-Key (P2PK) input script, the length of the placeholder is also based on the expected length of the signature. However, unlike P2PKH transactions, P2PK inputs do not involve a public key hash, so there is no need to include a placeholder for the public key.

In a P2PK input script, the placeholder for the signature is set to a fixed length of 72 bytes. This is because a valid ECDSA signature can have a maximum length of 72 bytes.

To summarize, the length of the placeholder in a standard P2PK input script is as follows:

- Placeholder for the signature: 72 bytes

Using this fixed-length placeholder ensures that the input script's overall size remains constant, regardless of the actual signature length when it is inserted during the signing process.

* With regard to length of placeholder:
Pay-to-Public-Key (P2PK) Input: In this type of input, the input script contains only the digital signature created using the private key associated with the public key used in the previous transaction's output (UTXO). The placeholder length in this case depends on the length of the signature, which is typically 64 bytes for ECDSA signatures with the secp256k1 curve used in Bitcoin and BSV.

Pay-to-Public-Key-Hash (P2PKH) Input: In this type of input, the input script contains both the digital signature and the public key (or its hash). The placeholder length would be the combined length of the signature and the public key (or hash). The public key hash is typically 20 bytes (160 bits), same as in Bitcoin.

Multi-Signature (P2SH) Input: In a multi-signature input, multiple signatures are required to spend the funds. The input script contains the script hash, which is a hash of the redeem script that specifies the conditions for spending the funds. The placeholder length would depend on the number of required signatures and the length of each signature, similar to Bitcoin.

Are these placeholders actually part of the signing?
No, the placeholders themselves are not part of the signing process. In the context of transaction inputs and scripts, placeholders are used as temporary spaces to reserve room for the actual signature and public key during the signing process.

The signing process involves creating a digital signature using the private key corresponding to the input's public key. This signature, along with the public key, is then placed in the input script to prove ownership of the funds. However, before the actual signature and public key are inserted, the input script needs to be assembled with the correct structure and size to accommodate them.

The placeholders serve as a way to determine the correct size of the input script before signing. They are typically filled with dummy values during this preparation stage. Once the input script is properly constructed with the right size, it is signed with the private key, and the actual signature and public key are placed into the previously reserved positions (placeholders).

After signing, the transaction is ready to be broadcasted to the network. It's essential to ensure that the correct script structure is maintained during signing to prevent any issues during validation and execution on the network.

So, while placeholders play a role in preparing the input script for signing, they are not included in the final signed transaction that is broadcasted on the blockchain. Instead, the actual signature and public key take their place in the input script, proving the ownership of the funds without revealing the private key.

* So this process is typically relevant when handling the transaction in a low level byte format. Which is less relevant with a high level language which will serialize accordingly.
Yes, you are correct. The process of handling placeholders and low-level byte formatting becomes more relevant when dealing directly with the raw transaction data in a low-level programming environment. In high-level programming languages, you often work with libraries or APIs that abstract away these low-level details.

For example, when using a high-level language like Python, JavaScript, or Ruby with a Bitcoin library, you usually interact with higher-level abstractions and methods that take care of serializing and deserializing transactions for you. These libraries handle the necessary byte formatting, including the placement of signatures and public keys in the input script, making it more convenient for developers.

High-level libraries also often provide functions or methods to create, sign, and broadcast transactions with a more user-friendly and intuitive interface. This abstraction allows developers to focus on the logic of their application rather than getting bogged down in the intricacies of low-level transaction encoding.

However, understanding the underlying byte format and transaction structure can still be helpful, especially for certain advanced use cases or debugging scenarios. It also allows developers to have a deeper understanding of how the Bitcoin protocol works and can be beneficial when working on custom implementations or optimizations.

In summary, while low-level byte formatting and placeholder handling are less relevant in high-level languages with Bitcoin libraries, it's still valuable to have a foundational understanding of how transactions are structured at the byte level, especially when dealing with more complex or specialized scenarios.