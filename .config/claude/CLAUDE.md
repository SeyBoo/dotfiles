# Claude Code Preferences

## Commit Style
- Make small atomic commits with concise messages
- Keep PR descriptions brief — a few bullet points, no fluff
- Use conventional commits (feat, fix, refactor, chore, docs, test)

## Code Style
- No unnecessary comments unless asked
- Keep functions small and focused
- Prefer early returns over nested conditionals
- Use meaningful variable/function names

## Workflow
- Always check existing code patterns before introducing new ones
- Never assume a library is available — verify it's in the project first
- Run lint/typecheck commands after making changes (ask user if unknown)
- NEVER commit unless explicitly asked
- NEVER push unless explicitly asked

## Communication
- Be concise and direct
- Answer in as few words as possible
- No emojis unless asked
- No preamble or postamble explanations
- Reference code with `file_path:line_number` format

## Cost Awareness
- Use smaller models for simple tasks when possible
- Batch multiple questions into single requests
- Avoid unnecessary tool calls
