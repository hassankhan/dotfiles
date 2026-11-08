# Agent configuration

This folder keeps the user-level settings of Codex, Claude Code and Cursor (`cursor-agent`) in sync.

The live files also hold host state and content from other installers, so they are not symlinked. Instead, `sync` merges only the keys that this repository owns into the live files and leaves every other key alone.

## Usage

```sh
agents/sync diff              # show what apply would change
agents/sync apply --dry-run   # same as diff
agents/sync apply             # write the owned keys (backs up each changed file first)
agents/sync status            # one line per target
agents/sync capture           # copy live values of owned keys back into the host fragments
```

`sync` runs with `uv` (from the mise config) and downloads `tomlkit` on first use. Pass `--only <target>` to limit a command to one target, or `--home <dir>` to test against a copy of a home directory.

## What this repository owns

Every key in a fragment is owned. Removing a key from a fragment removes it from the live file on the next `apply`.

| Source | Live file |
| --- | --- |
| `shared/response-style.md` | Codex `developer_instructions` |
| `shared/mcp-servers.json` | Codex `mcp_servers.*`, Cursor `mcpServers.*` |
| `shared/attribution.json` | Claude `includeCoAuthoredBy` and `gitAttribution`, Cursor `attribution.*` |
| `codex/config.toml` | `~/.codex/config.toml` |
| `claude/settings.json` | `~/.claude/settings.json` |
| `cursor/mcp.json` | `~/.cursor/mcp.json` |

`~/.cursor/cli-config.json` is only updated when it exists, because `cursor-agent` writes required fields such as `permissions` on its first run.

Files that only you write are linked with stow from `stow/claude` (`--no-folding`): the ASD-STE100 output style, the status line script and the `trim-comments` skill.

## What it never touches

- Content from [hassankhan/skills](https://github.com/hassankhan/skills): the `hk-preferences` block in `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md`, `~/.codex/agents/`, `~/.claude/agents/`, `~/.{codex,claude}/references/`, the Stop/SubagentStop hooks in `~/.claude/settings.json` and `~/.codex/hooks.json`, and `~/.agents/skills`. Its installers refuse symlinks, which is why these live files must stay regular files.
- Permissions: Claude `permissions.*`, Codex `rules/default.rules` and MCP tool `approval_mode` entries, Cursor `permissions`.
- Host state: Codex `projects.*.trust_level`, `hooks.state`, `tui.*` and `notice.*`; Claude `feedbackSurveyState` and prompt acknowledgements; Cursor `model`, `authInfo` and the Slack MCP `oauth` block; `~/.claude.json`.
- Secrets and machine data: `auth.json`, `*.sqlite`, history, sessions, caches and plugin caches. `sync` refuses fragments with secret-like key names.

## Manual steps

- **Cursor response style:** `cursor-agent` has no user-level rules file. Set the ASD-STE100 rule from `shared/response-style.md` in your Cursor account's user rules.
- **Claude response style:** organization instructions on claude.ai apply it. The local output style is linked but not selected (`outputStyle` is unset).

## Safety

- `apply` saves a backup of each changed file under `~/.local/state/dotfiles/agents/backups/` and records the owned keys in `applied.json` beside it.
- It stops if the live file changed between reading and writing, and it refuses to write through a symlink.
- Run it when the skills installers are not running. A running host can still write its own file after `apply`.
