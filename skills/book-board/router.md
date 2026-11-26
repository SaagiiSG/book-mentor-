# Router: which department gets the question

The router scores the prompt against the four departments, then picks a mode. Read this file on every call, before any brain.

## The four departments

| Dept | Folder | Owns the question | Typical asks |
|---|---|---|---|
| Productivity | `brains/productivity/` | Where should your time and attention go, and what system makes it happen every week? | focus, procrastination, overwhelm, habits, planning, too busy, delegating my own tasks, routines, burnout, learning a skill |
| Sales | `brains/sales/` | Will this close, at what price, and what exactly do you say and do to get the yes? | close rate, discovery call, objections, "too expensive", negotiation, follow up, prospecting, cold outreach, pricing conversation, sales script, sales team, pipeline |
| Growth | `brains/growth/` | What is the constraint on growth right now, and which move removes it without breaking the business? | scaling, strategy, new market, hiring, team, operations, systems, processes, goals and KPIs, cash flow, profit, pivot, build versus buy, selling the business, culture |
| Marketing | `brains/marketing/` | Who exactly is this for, what message makes them care, and which channel brings them in at a profit? | leads, ads, content, social media, brand, positioning, messaging, copy, website, funnel, launch, audience, word of mouth, channel choice |

## Step 1: score each department 0 to 3

- **3**: the question lives in this department (its owned question is the main thing being asked).
- **2**: the department is materially involved (the answer changes if you ignore it).
- **1**: touched at the edges.
- **0**: not involved.

Score on what the person needs decided, not on keywords alone. "My ads get clicks but nobody buys" names ads (Marketing) but the decision may sit in Sales (the close) or in the offer. Ask: if only one department answered, what would be missing?

## Step 2: pick the mode

| Scores | Mode | What happens |
|---|---|---|
| One department at 3, every other at 1 or 0 | **Single** | Load that department only. The main agent answers in that advisor's shape. No subagents. |
| One at 3 and one or more at 2 | **Lead plus council** | Spawn every department scoring 2 or 3 as parallel subagents (at most three). The 3-scored department leads the synthesis. |
| Two or three at 2 or 3, none clearly leading | **Council** | Spawn those two or three as parallel subagents. The main agent synthesizes. |
| All four at 2 or more, or the prompt is a whole-business question ("review my business", "what should I fix first") | **Full board** | Spawn all four. |
| Everything at 0 or 1 (not a business question, or too vague to place) | **Clarify** | Ask one short question that would place it ("Is the problem getting leads, closing them, or keeping up with the work?"). If the user wants an answer anyway, run Full board. |

User overrides win: `--dept sales` (Single on that department), `--depts sales,marketing` (Council on those), `--all` (Full board), `--solo` (no subagents: the main agent reads each chosen brain itself, one after another).

## Step 3: tell the user the routing in one line

Before answering, print one line, for example:
`Routing: Sales 3, Marketing 2, Growth 1, Productivity 0. Lead plus council: Sales leads, Marketing advises.`

## Examples

| Prompt | Scores (P, S, G, M) | Mode |
|---|---|---|
| "How do I stop procrastinating on hard tasks?" | 3, 0, 0, 0 | Single: Productivity |
| "A prospect said we're too expensive. What do I say?" | 0, 3, 0, 0 | Single: Sales |
| "Should I hire a COO or an ops manager first?" | 0, 0, 3, 0 | Single: Growth |
| "How do I write a better headline for my landing page?" | 0, 0, 0, 3 | Single: Marketing |
| "We get lots of leads but close very few." | 0, 3, 0, 2 | Lead plus council: Sales leads, Marketing |
| "Should I raise my prices?" | 0, 3, 2, 2 | Lead plus council: Sales leads, Growth, Marketing |
| "I'm the bottleneck, I work 70 hours and revenue is flat." | 3, 0, 3, 0 | Council: Productivity, Growth |
| "We're launching a new product next quarter, what should we do?" | 0, 2, 2, 3 | Lead plus council: Marketing leads, Sales, Growth |
| "Look at my business and tell me what to fix first." | 2, 2, 2, 2 | Full board |
| "What's a good book?" | 0, 0, 0, 0 | Clarify |
