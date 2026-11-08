---
name: trim-comments
description: Reduce excessive code comments — keep only concise "why" comments, delete redundant or overweight ones. Use after writing or reviewing code that accumulated too many comments, or when the user asks to clean up, dial down, or trim comments.
---

# Trim comments

Reduce the comments in the code under consideration to the minimum that carries real information.

## Scope

- If arguments name files or directories, work on those.
- Otherwise, default to comments added or touched in the current working diff (`git diff` + staged changes). If the working tree is clean, use the most recent commit's diff.
- Only edit comments. Do not change code behavior, formatting of code lines, or docstrings/TSDoc that document a public API (those follow their own conventions).

## Pass 1 — rewrite or remove

Apply these rules to every comment in scope:

- **Why, not what.** A comment must explain the "why" of the code as it currently is. If it restates what's already clear from the code, remove it.
- **No change-narration.** Remove comments that reference what was fixed, changed, altered, or how the code used to be. Comments describe the present, not the diff.
- **Concise.** Rewrite wordy comments down to the fewest words that preserve the "why".
- **Plain facts.** Avoid compound if/then explanations; prefer stating plain facts.

## Pass 2 — delete overweight comments

Reassess every comment that survived pass 1, and delete it fully when its own complexity exceeds the code it annotates:

- If reading and understanding the comment takes more effort than reading the code itself, delete it.
- If the comment is longer than the code it describes, delete it.
- If the code is simple enough that the "why" is apparent without help, delete it.

## Output

Report what was removed, rewritten, and kept, with a rough count per file. Don't re-add or expand any comments while doing this.
