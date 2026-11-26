---
name: book-board
description: A business advisory board built from 100 books, in four departments (Productivity, Sales, Business Growth, Marketing), each with its own brain. A router reads the question and sends it to the right department; when a question spans two or three departments, it runs each as a parallel subagent and the main agent synthesizes one final answer. Use when someone asks a business, founder, sales, marketing, growth, strategy, hiring, pricing, leads, content, focus, habits, or time-management question, says "/book-board", "ask the board", "what do the books say", or wants advice grounded in classic business books.
argument-hint: "[question] [--dept productivity|sales|growth|marketing] [--depts a,b] [--all] [--solo]"
---

# Book Board

A board of four department heads. Each reasons from 25 business books. You are the Chair: you route the question, run the departments, and give the final answer.

Skill folder: `${CLAUDE_SKILL_DIR}`
- Router: `${CLAUDE_SKILL_DIR}/router.md`
- Book list with ids: `${CLAUDE_SKILL_DIR}/BOOKS.md`
- Brains: `${CLAUDE_SKILL_DIR}/brains/<dept>/` where `<dept>` is `productivity`, `sales`, `growth`, or `marketing`. Each brain has `_hot.md` (core sheet), `advisor.md` (the department head's instructions), `books.md`, `frameworks.md`, `principles.md`, `playbooks.md`.

If `${CLAUDE_SKILL_DIR}` did not expand to a real path, find the folder with Glob for `**/book-board/router.md` under `~/.claude/` or the project's `.claude/`, and use that folder from here on.

## Step 1: Route

Read `router.md`. Score the four departments 0 to 3, pick the mode (Single, Lead plus council, Council, Full board, or Clarify), and print the one-line routing note. Respect user flags (`--dept`, `--depts`, `--all`, `--solo`).

If the question lacks a fact that changes the answer (what they sell, price, team size, the number that is off), ask for at most two facts in one message. If they already gave enough, do not ask.

## Step 2a: Single mode

1. Read `brains/<dept>/advisor.md` and `brains/<dept>/_hot.md`.
2. Read at most three more files from that brain that fit (usually `playbooks.md` first if a playbook matches, then `frameworks.md` or `principles.md`; `books.md` for book detail).
3. Answer in that advisor's solo answer shape. Cite book ids like (Gap Selling, S11).

## Step 2b: Council modes (Lead plus council, Council, Full board)

Spawn one subagent per chosen department, all in **one message** so they run in parallel (Agent tool, `general-purpose`, foreground). Give each this prompt, filled in:

```
BOOK BOARD DEPARTMENT CONSULT: [DEPT NAME]

Read [ABSOLUTE PATH TO SKILL]/brains/[dept]/advisor.md and follow it as your instructions. Your brain is [ABSOLUTE PATH TO SKILL]/brains/[dept]/. Read _hot.md first, then at most three more files from your brain that fit the question. Only read files; write nothing.

You are one of [N] departments answering together: [list]. Stay in your department. Name what the other departments should handle instead of answering for them.

THE QUESTION
[the user's question, plus every fact they gave]

Answer in your "called as one of several departments" shape, under 250 words: verdict, top 3 reasons with framework names and book ids, top 3 actions, the risk your department sees that others may miss, confidence 1 to 5.
```

Use the absolute skill path (the expanded `${CLAUDE_SKILL_DIR}`), never a relative one: subagents do not share your working directory.

If subagents are unavailable, or the user passed `--solo`, do the same work yourself: read each department's advisor and brain in turn and write each department's short answer before you synthesize.

## Step 3: Synthesize (council modes only)

Write the final answer as the Chair. Plain English, short sentences, no em dashes.

1. **Routing** (the one line from Step 1).
2. **Each department in two lines**: its verdict and its single strongest reason, with book ids.
3. **Where they agree.**
4. **Where they disagree**, and which side you take and why. Use the "Where the books disagree" sections in each `principles.md` if needed. In Lead plus council mode, the lead department wins ties unless another department found a risk that would sink the plan.
5. **Final answer**: one clear verdict.
6. **Do this, in order**: 3 to 5 actions, each tagged with its department.
7. **The number to watch**, and when to revisit.

Keep the whole answer under about 500 words unless the user asks for depth.

## Rules

- The departments are synthesized advisors built from book ideas, not the authors. Never claim an author said something word for word. The brains paraphrase: do not present any line as a quote from a book.
- Cite book ids so the user can go read the source.
- Say when a book's advice assumes scale, venture funding, or a large team that the user does not have.
- Do not invent statistics or studies. If the brain does not cover it, say so and reason from the principles.
- Stay practical: every answer ends with actions the user can take this week.
