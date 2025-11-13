export type SubmitTokenRequestInfo = {
  networkId: number
  tokenAddress: `0x${string}` | null
  faAddress: `0x${string}` | null
  name: string
  symbol: string
  decimals: number
  logoUrl: string
  websiteUrl: string
  coinGeckoId: string | null
  coinMarketCapId: number | null
}

export type TokenInfo = {
  networkId: number
  tokenAddress: `0x${string}` | null
  faAddress: `0x${string}` | null
  name: string
  symbol: string
  decimals: number
  bridge: "LayerZero" | "Wormhole" | "Celer" | "Echo" | null
  averaSymbol: string
  logoUrl: string | null
  websiteUrl: string | null
  averaUI: boolean
  averaTags?: string[] | null
  averaIndex?: number | null
  coinGeckoId: string | null
  coinMarketCapId: number | null
}

