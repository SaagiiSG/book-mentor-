# Book Board

An advisory board for Claude Code, built from 103 books in five departments:

| Department | Books | Owns the question |
|---|---|---|
| Business | 36, built on Alex Hormozi's $100M series ($100M Offers, $100M Leads, $100M Money Models) plus SPIN Selling, Never Split the Difference, StoryBrand, Positioning, Breakthrough Advertising, The E-Myth, The Art of War, Zero to One, ... | What is the offer, where do the buyers come from, how do you close and keep them, and what is the constraint on growth right now? |
| Productivity | 20 (Atomic Habits, Deep Work, Getting Things Done, Essentialism, The ONE Thing, Buy Back Your Time, ...) | Where should your time and attention go, and what system makes it happen every week? |
| Mindset | 15 (Can't Hurt Me, Meditations, Mindset, The Obstacle Is the Way, Ego Is the Enemy, Grit, The War of Art, Rich Dad Poor Dad, The Psychology of Money, ...) | What story are you telling yourself about this, and what would you do if you were not afraid, stuck, or ego-driven? |
| Psychology and Mental Health | 15 (Thinking, Fast and Slow, The Body Keeps the Score, Feeling Good, Dopamine Nation, Why We Sleep, Burnout, Daring Greatly, The Anxious Generation, ...) | What is happening in your mind and body here, and what helps, safely? |
| Relationships and Leadership | 17 (How to Win Friends and Influence People, Influence, The 48 Laws of Power, Never Eat Alone, Crucial Conversations, Radical Candor, The Five Dysfunctions of a Team, Extreme Ownership, ...) | Who matters here, what do they need from you, and what conversation or move builds trust and gets it done? |

The full list with ids is in [BOOKS.md](BOOKS.md).

## How it works

```
your question
     |
  router.md  -- safety check, then scores the five departments 0 to 3
     |
     +-- one clear department ---------> Single: that brain answers
     |
     +-- 2 or 3 departments involved --> Council: each runs as a parallel subagent,
     |                                    the main agent (the Chair) synthesizes
     +-- whole-life or whole-business -> Full board: the top four, then synthesis
     |
     +-- too vague --------------------> Clarify: one question, then route
```

The Business department reasons along Hormozi's spine, in `brains/business/spine.md`: **Offer, Leads, Close, Money Model, Scale**. Every Business answer first names which stage is the constraint, then uses Hormozi's frame for that stage, then the supporting books.

Each department brain (`skills/book-board/brains/<dept>/`) holds:

- `_hot.md`: the core sheet, read on every call (rules, top frameworks, decision loop, which book for which problem, where the lens misfires)
- `advisor.md`: the department head's instructions and answer shapes
- `books.md`: each book's core idea, key frameworks, when to use it, its limits, and the author's own words where available
- `frameworks.md`: the frameworks across the department's books, with steps and scoring guidance
- `principles.md`: decision rules, and where the books disagree
- `playbooks.md`: step-by-step plans for the situations people bring most often
- `talks.md`: the author talks and interviews used to ground the brain (T ids)
- Business only: `spine.md`, the Hormozi operating map

The brains summarize and paraphrase the books' ideas with book ids for citation and contain no copyrighted book text. Most books are also grounded in their authors' own words: verbatim quotes from the author's talks and interviews on YouTube, each with a T id and checked word for word against the transcript. The Art of War and Meditations are public domain, so they are quoted from the text itself.

## Safety

The Psychology and Mental Health department is educational self-help built from books. It is not therapy, diagnosis or medical advice. It never advises on medication, and when someone shows signs of crisis it points them to emergency services and crisis lines, Mongolian numbers first (103 emergency, 1800-2000 National Center for Mental Health counselling line, 108 child helpline), then international ones (988 in the US and Canada, 116 123 in the UK and Ireland, findahelpline.com), and to a licensed professional. The router checks for crisis signs before anything else.

## Language and onboarding

- **Mongolian by default.** Every answer, question and artifact is in Mongolian (Cyrillic). Pass `--en`, or write in English and ask to continue in English, to switch. Book titles stay in their original language, with a Mongolian translation where helpful. Author quotes are shown verbatim in English with a Mongolian translation marked "Орчуулга".
- **Onboarding.** On first use the board quietly gathers what it can about you (this chat, attached files, memory and past chats when available, project knowledge, or a saved profile in Claude Code). If it knows enough, it confirms its summary with you. If not, it runs a short life audit: 12 questions in 3 rounds covering your work, the five areas scored 1 to 10, and what you are putting off.
- **Life audit artifact.** After the audit it builds a dashboard (`assets/life-audit.html`): your five scores with the main constraint in each, the top 3 priorities across your life, a 30-day plan sized to the hours you have, 3 books to start with, 3 questions to ask the board next, and a profile block you can paste into a new chat to skip onboarding.
- **Works in regular chat.** In Claude.ai and the Claude app there are no subagents, so council questions run each department in turn inside one answer. In Claude Code, council questions run as parallel subagents.

## Install

### In Claude.ai or the Claude app (regular chat)

1. Download `book-board-skill.zip` (the `skills/book-board` folder zipped, with `SKILL.md` at its top level).
2. In Claude, open Settings, then Capabilities. Make sure code execution and file creation is on (skills need it).
3. In the Skills section, upload the zip and turn the skill on.
4. Start a new chat and write "Сайн байна уу, эхэлье" or "/book-board" to begin onboarding, or just ask a question.


### Option 1: as a plugin (recommended)

In any Claude Code session:

```
/plugin marketplace add SaagiiSG/book-mentor-
/plugin install book-board@book-board
```

Invoke it with `/book-board:book-board <question>`, or just ask a business or life question and Claude picks the skill.

### Option 2: as a personal skill (no plugin system)

```bash
git clone https://github.com/SaagiiSG/book-mentor- && cd book-mentor- && ./install.sh
```

This copies `skills/book-board` to `~/.claude/skills/book-board`, so it works in every project on this machine. Invoke it with `/book-board <question>`.

### Option 3: for one project only

Copy `skills/book-board` into that project's `.claude/skills/book-board`.

## Use

```
/book-board How do I build an offer people feel stupid saying no to?
/book-board A prospect said we're too expensive. What do I say?
/book-board I'm scared to raise my prices.
/book-board I'm exhausted and can't switch off at night.
/book-board My co-founder and I keep fighting about money.
/book-board --all Look at my business and my life and tell me what to fix first.
/book-board --dept relationships How do I give hard feedback to my best employee?
/book-board --depts business,mindset Should I quit my job to go full time on this?
/book-board --solo ...   (no subagents, the main agent reads each brain itself)
```

Every answer starts with a routing line, for example:
`Routing: Mindset 3, Business 2, Psychology 0, Productivity 0, Relationships 0. Lead plus council: Mindset leads, Business advises.`

## Changelog

- 2.1: Mongolian by default; onboarding with background context gathering and a 12-question life audit; life audit dashboard artifact; council runs inside one answer in regular chat; Mongolian crisis numbers (103, 1800-2000, 108).
- 2.0: five departments. Sales, Marketing and Growth merged into one Business department built on Hormozi's $100M Offers, Leads and Money Models (spine: Offer, Leads, Close, Money Model, Scale). New Mindset, Psychology and Mental Health, and Relationships and Leadership departments with 30 new books, grounded in 36 new author talks. Router safety check for mental health.
- 1.1: swapped 17 books for popular classics; grounded 84 books in verbatim author quotes from talks.
- 1.0: four departments, 100 books, router and council.

## Notes

- The department heads are synthesized advisors built from the books' ideas. They are not the authors. They quote authors only from talks (T ids in each brain's talks.md) or public-domain texts, never from copyrighted book text.
- Citations like (Gap Selling, B07) point to [BOOKS.md](BOOKS.md) so you can read the source.
- Add a department by creating `brains/<new>/` with the same files and a row in `router.md`.
