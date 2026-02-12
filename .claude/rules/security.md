# Security Rules

## Never Commit

- `.env` files (except `.env.example` with placeholders)
- Token values, JWT secrets, API keys, passwords
- Hardcoded credentials
- Private keys, certificates

## Safe to Commit

- `.env.example` (template with placeholders only)
- Configuration files (non-secret settings)
- Public keys, public JWTs

## When Writing Code

- Never hardcode secrets — use environment variables
- Hash sensitive tokens before storing in database
- Validate input at system boundaries
- Use parameterized queries (prevent SQL injection)
- Sanitize output (prevent XSS)
- Enforce authentication on protected endpoints

## Security Checks Before PR

- [ ] No secrets in committed code
- [ ] Auth endpoints validate signatures/tokens
- [ ] Database stores hashes, not raw secrets
- [ ] TLS required for external connections
