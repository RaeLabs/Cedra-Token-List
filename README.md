# Token List for Cedra Blockchain

## Overview

Cedra's Token List is a categorized regsistry for tokens tradeable on the Cedra blockchain. You can use the public API endpoint at `https://api.avera.finance` or the JSON file to fetch the Cedra Token List.

## Avera Tags:

To enhance token classification and identification, we've introduced a field `averaTags` in token list response. This field combines categories and labels into a single parameter, providing clearer insights and context about each token's status and characteristics.

### Categories (Tokens are segregated based on their category):

- `Native`: Tokens that are native to the chain and issued directly on it (excludes meme)
- `Meme`: Tokens primarily driven by community hype, memes, or trends
- `Bridged`: Tokens that originate from another chain and are bridged for use


### Labels

- `Verified`: Tokens with verified logo-to-address mapping, ensuring accurate identification.
- `Recognized`: Tokens with mapped logos but may not be verified by the community yet or have had their Verified label revoked.
- `Unverified`: Tokens tradable on-chain but aren't recognized or verified yet.
- `Banned`: Tokens flagged for confirmed security risks or malicious activity, discouraged for trading.
- `RWA`: Real-world asset tokens
- `LP`: Tokens representing liquidity pool shares in asset pairs.

## Projects - How to Add Your Token to the Cedra Token List:

To add your token to the Cedra Token List, follow these steps:

### 1. Fork the Repository

Fork the repository on GitHub to create your own copy.

### 2. Add Token Icon (Optional)

Add the token logo file (e.g., `token_symbol.svg` or `token_symbol.png`) to the `logos` folder. Ensure it's .svg or ~100x100 pixels in .png format. The logo URL should follow this format:
```
https://raw.githubusercontent.com/RaeLabs/Cedra-Token-List/main/logos/token_symbol.svg
```

### 3. Update `token-list.json`

Add a `TokenInfo` object to the `token-list.json` array. Provide the following details:

- `networkId`: The network ID associated with the token (Default: 2 for Cedra Testnet, 1 for Mainnet when available)
- `tokenAddress`: The complete address of the token as per the Cedra Coin Standard (Legacy)
- `faAddress`: The complete address of the token as per the Cedra Coin Standard (Legacy)
- `name`: The on-chain registered name of the token
- `symbol`: The on-chain registered symbol of the token
- `decimals`: The number of decimal places of the token
- `bridge`: The bridge associated with the token, if applicable (`"LayerZero"`, `"Wormhole"`, `"Celer"`, `"Echo"`, or `null`)
- `averaSymbol`: Similar to symbol, but with prefixes based on the bridge: `lz` for LayerZero, `wh` for Wormhole, `ce` for Celer (or same as `symbol` if no bridge)
- `logoUrl`: The URL for the token's logo (use the GitHub raw URL if added to logos folder)
- `websiteUrl`: The official website URL of the token (optional)
- `averaUI`: Set to `true` to display the token in Avera DEX UI
- `averaTags`: Array of tags (e.g., `["Native", "Verified"]`)
- `averaIndex`: The default sorting order of tokens within the Avera UI (optional)
- `coinGeckoId`: The CoinGecko ID of the token (optional)
- `coinMarketCapId`: The CoinMarketCap ID of the token (optional)

### 4. Commit Changes

Commit your changes with a descriptive message explaining the modifications made.

### 5. Make a Pull Request

Push your changes to your fork and open a pull request to the main repository. Once the PR is merged, the token will be automatically synced to the database via GitHub Actions.

## Cedra Token List Response

Cedra Token List Response object consists of the following fields:

- `networkId`: The network ID associated with the token (Default: 2 for Cedra Testnet, 1 for Mainnet when available)
- `tokenAddress`: The complete address of the token as per the Cedra Coin Standard (Legacy)
- `faAddress`: The complete address of the token as per the Cedra Coin Standard (Legacy)
- `name`: The on-chain registered name of the token
- `symbol`: The on-chain registered symbol of the token
- `decimals`: The number of decimal places of the token
- `bridge`: The bridge associated with the token, if applicable (optional)
- `averaSymbol`: Similar to symbol, but with prefixes based on the bridge: lz for LayerZero, wh for Wormhole, and ce for Celer
- `logoUrl`: The URL for the token's logo(optional)
- `websiteUrl`: The official website URL of the token (optional)
- `averaUI`: When set to true, displays the token name and logo on the Avera DEX.
- `averaTags`: Lists the tags associated with the token.
- `averaIndex`: The default sorting order of tokens within the Avera UI
- `coinGeckoId`: The CoinGecko ID of the token (optional)
- `coinMarketCapId`: The CoinMarketCap ID of the token (optional)

## API Endpoints

- `GET /tokens` - Get all tokens (with optional query parameters: `networkId`, `averaUI`, `page`, `limit`)
- `GET /tokens.json` - Get token list as JSON file (returns tokens with `averaUI: true` by default)
- `POST /tokens/submit` - Submit token request via API (stores in `token_requests` table for manual approval)

