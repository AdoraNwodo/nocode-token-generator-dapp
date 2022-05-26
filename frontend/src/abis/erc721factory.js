const erc721FactoryABI = [
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "string",
        "name": "_name",
        "type": "string"
      },
      {
        "indexed": false,
        "internalType": "string",
        "name": "_symbol",
        "type": "string"
      },
      {
        "indexed": false,
        "internalType": "string",
        "name": "_tokenType",
        "type": "string"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "_tokenAddress",
        "type": "address"
      }
    ],
    "name": "Created",
    "type": "event"
  },
  {
    "inputs": [
      {
        "internalType": "string",
        "name": "name_",
        "type": "string"
      },
      {
        "internalType": "string",
        "name": "symbol_",
        "type": "string"
      },
      {
        "internalType": "bool",
        "name": "isBurnable_",
        "type": "bool"
      },
      {
        "internalType": "bool",
        "name": "isMintable_",
        "type": "bool"
      }
    ],
    "name": "create",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "getAll",
    "outputs": [
      {
        "components": [
          {
            "internalType": "string",
            "name": "name",
            "type": "string"
          },
          {
            "internalType": "string",
            "name": "symbol",
            "type": "string"
          },
          {
            "internalType": "string",
            "name": "tokenType",
            "type": "string"
          },
          {
            "internalType": "bool",
            "name": "isBurnable",
            "type": "bool"
          },
          {
            "internalType": "bool",
            "name": "isMintable",
            "type": "bool"
          },
          {
            "internalType": "address",
            "name": "tokenAddress",
            "type": "address"
          }
        ],
        "internalType": "struct Token[]",
        "name": "",
        "type": "tuple[]"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
];

export { erc721FactoryABI };