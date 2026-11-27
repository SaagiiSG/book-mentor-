# Book Board

A business advisory board for Claude Code, built from 100 books in four departments:

| Department | Books | Owns the question |
|---|---|---|
| Productivity | 25 (Atomic Habits, Deep Work, Can't Hurt Me, Meditations, Think and Grow Rich, The Let Them Theory, ...) | Where should your time and attention go, and what system makes it happen every week? |
| Sales | 25 (Influence, The 48 Laws of Power, Never Split the Difference, How to Win Friends, $100M Offers, SPIN Selling, ...) | Will this close, at what price, and what exactly do you say and do to get the yes? |
| Business Growth | 25 (The Art of War, Rich Dad Poor Dad, The Psychology of Money, Good to Great, The E-Myth, Zero to One, ...) | What is the constraint on growth right now, and which move removes it without breaking the business? |
| Marketing | 25 (Start With Why, $100M Leads, Building a StoryBrand, Crushing It!, Hook Point, Positioning, ...) | Who exactly is this for, what message makes them care, and which channel brings them in at a profit? |

The full list with ids is in [BOOKS.md](BOOKS.md).

## How it works

```
your question
     |
  router.md  -- scores Productivity, Sales, Growth, Marketing 0 to 3
     |
     +-- one clear department ---------> Single: that brain answers
     |
     +-- 2 or 3 departments involved --> Council: each runs as a parallel subagent,
     |                                    the main agent (the Chair) synthesizes
     +-- whole-business question ------> Full board: all four, then synthesis
     |
     +-- too vague --------------------> Clarify: one question, then route
```

Each department brain (`skills/book-board/brains/<dept>/`) holds:

- `_hot.md`: the core sheet, read on every call (rules, top frameworks, decision loop, which book for which problem, where the lens misfires)
- `advisor.md`: the department head's instructions and answer shapes
- `books.md`: 25 books, core idea, key frameworks, when to use, limits
- `frameworks.md`: the frameworks across the 25 books, with steps and scoring guidance
- `principles.md`: decision rules, and where the books disagree
- `playbooks.md`: step-by-step plans for the situations owners bring most often
- `talks.md`: the author talks and interviews used to ground the brain (T ids)

The brains summarize and paraphrase the books' ideas with book ids for citation, and contain no copyrighted book text. Version 1.1 grounds them in the authors' own words: for 84 of the 100 books, verbatim quotes taken from the author's talks and interviews on YouTube, each with a T id and checked word for word against the transcript. The Art of War and Meditations are public domain, so they are quoted from the text itself.

## Install

### Option 1: as a plugin (recommended)

In any Claude Code session:

```
/plugin marketplace add SaagiiSG/book-mentor-
/plugin install book-board@book-board
```

Invoke it with `/book-board:book-board <question>`, or just ask a business question and Claude picks the skill.

### Option 2: as a personal skill (no GitHub needed)

Unzip, then from inside the folder:

```bash
./install.sh
```

This copies `skills/book-board` to `~/.claude/skills/book-board`, so it works in every project on this machine. Invoke it with `/book-board <question>`.

### Option 3: for one project only

Copy `skills/book-board` into that project's `.claude/skills/book-board`.

## Use

```
/book-board A prospect said we're too expensive. What do I say?
/book-board We get plenty of leads but close very few.
/book-board I work 70 hours a week and revenue has been flat for a year.
/book-board --all Review my business: 3-person agency, $25K a month, mostly referrals.
/book-board --dept marketing Rewrite my homepage headline: ...
/book-board --depts sales,growth Should I hire my first salesperson?
/book-board --solo ...   (no subagents, the main agent reads each brain itself)
```

Every answer starts with a routing line, for example:
`Routing: Sales 3, Marketing 2, Growth 1, Productivity 0. Lead plus council: Sales leads, Marketing advises.`

## Changelog

- 1.1: swapped 17 books for popular classics (The Art of War, The 48 Laws of Power, Rich Dad Poor Dad, The Psychology of Money, Can't Hurt Me, Meditations, Start With Why, and more); grounded 84 books in verbatim author quotes from talks (the other 16 had no usable author recording and stay paraphrase).
- 1.0: four departments, 100 books, router and council.

## Notes

- The department heads are synthesized advisors built from the books' ideas. They are not the authors. They quote authors only from talks (T ids in each brain's talks.md), never from book text.
- Citations like (Gap Selling, S11) point to [BOOKS.md](BOOKS.md) so you can read the source.
- Add a department by creating `brains/<new>/` with the same six files and a row in `router.md`.
