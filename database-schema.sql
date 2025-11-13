-- Network IDs:
--   1 = Cedra Mainnet (for future use)
--   2 = Cedra Testnet (currently in use)

-- Tokens table (main token list)
CREATE TABLE IF NOT EXISTS tokens (
  id SERIAL PRIMARY KEY,
  network_id INTEGER NOT NULL DEFAULT 2, -- Default to testnet (2)
  token_address TEXT,
  fa_address TEXT,
  name TEXT NOT NULL,
  symbol TEXT NOT NULL,
  decimals INTEGER NOT NULL,
  bridge TEXT CHECK (bridge IN ('LayerZero', 'Wormhole', 'Celer', 'Echo')) DEFAULT NULL,
  avera_symbol TEXT NOT NULL,
  logo_url TEXT,
  website_url TEXT,
  avera_ui BOOLEAN DEFAULT true,
  avera_tags TEXT[] DEFAULT NULL,
  avera_index INTEGER DEFAULT NULL,
  coin_gecko_id TEXT,
  coin_market_cap_id INTEGER,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(token_address, fa_address)
);

-- Token requests table (for pending token submissions)
CREATE TABLE IF NOT EXISTS token_requests (
  id SERIAL PRIMARY KEY,
  network_id INTEGER NOT NULL DEFAULT 2, -- Default to testnet (2)
  token_address TEXT,
  fa_address TEXT,
  name TEXT NOT NULL,
  symbol TEXT NOT NULL,
  decimals INTEGER NOT NULL,
  logo_url TEXT,
  website_url TEXT,
  coin_gecko_id TEXT,
  coin_market_cap_id INTEGER,
  status TEXT CHECK (status IN ('pending', 'approved', 'rejected')) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_tokens_token_address ON tokens(token_address);
CREATE INDEX IF NOT EXISTS idx_tokens_fa_address ON tokens(fa_address);
CREATE INDEX IF NOT EXISTS idx_tokens_symbol ON tokens(symbol);
CREATE INDEX IF NOT EXISTS idx_tokens_network_id ON tokens(network_id);
CREATE INDEX IF NOT EXISTS idx_tokens_avera_ui ON tokens(avera_ui);
CREATE INDEX IF NOT EXISTS idx_tokens_avera_tags ON tokens USING GIN(avera_tags);
CREATE INDEX IF NOT EXISTS idx_tokens_avera_index ON tokens(avera_index);

CREATE INDEX IF NOT EXISTS idx_token_requests_status ON token_requests(status);
CREATE INDEX IF NOT EXISTS idx_token_requests_created_at ON token_requests(created_at);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers to automatically update updated_at
CREATE TRIGGER update_tokens_updated_at BEFORE UPDATE ON tokens
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_token_requests_updated_at BEFORE UPDATE ON token_requests
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

