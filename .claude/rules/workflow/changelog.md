# CHANGELOG Convention

Follow [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/).

## Rules

1. Filename: Always `CHANGELOG.md`
2. Audience: Write for humans, not machines
3. Structure: Reverse chronological order (newest first)
4. Maintain `## [Unreleased]` section at top for unreleased changes
5. Version format: `## [VERSION] - YYYY-MM-DD` (ISO 8601)
6. Yanked releases: Append `[YANKED]` — e.g., `## [1.0.1] - 2026-01-15 [YANKED]`
7. Categories (in order): Added, Changed, Deprecated, Removed, Fixed, Security
8. Entry style: Bullet points (`-`), concise human-readable sentences
9. Semantic Versioning assumed unless stated otherwise
10. Comparison links at bottom: `[Unreleased]: https://...`

## Example

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New feature description

## [1.0.0] - 2026-01-15

### Added
- Initial release

[Unreleased]: https://gitlab.example.com/group/project/-/compare/v1.0.0...HEAD
[1.0.0]: https://gitlab.example.com/group/project/-/releases/v1.0.0
```
