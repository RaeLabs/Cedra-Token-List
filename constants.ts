// Cedra Network IDs
export const CEDRA_NETWORK_IDS = {
  TESTNET: 2, // Cedra Testnet
  MAINNET: 1, // Cedra Mainnet
} as const

export type CedraNetworkId = typeof CEDRA_NETWORK_IDS[keyof typeof CEDRA_NETWORK_IDS]

