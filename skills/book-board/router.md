# Router: which department gets the question

The router scores the prompt against the five departments, then picks a mode. Read this file on every call, before any brain.

## The five departments

| Dept | Folder | Owns the question | Typical asks |
|---|---|---|---|
| Business | `brains/business/` | What is the offer, where do the buyers come from, how do you close and keep them, and what is the constraint on growth right now? | offer, pricing, leads, ads, content, brand, positioning, copy, funnel, sales calls, objections, close rate, upsells, retention, cash flow, profit, strategy, competitors, scaling, systems, selling the business |
| Productivity | `brains/productivity/` | Where should your time and attention go, and what system makes it happen every week? | focus, too busy, procrastination (as a systems problem), habits, routines, planning, priorities, calendar, delegating my own tasks, learning a skill |
| Mindset | `brains/mindset/` | What story are you telling yourself about this, and what would you do if you were not afraid, stuck, or ego-driven? | motivation, discipline, confidence, self-belief, fear of failure, imposter feelings, resistance, ego, setbacks, giving up, purpose, money mindset, long-term thinking |
| Psychology and Mental Health | `brains/psychology/` | What is happening in your mind and body here, and what helps, safely? | stress, burnout, anxiety, low mood, overthinking, bad decisions and biases, emotions, sleep, phone or work addiction, trauma, introversion, loneliness, self-criticism, should I see a therapist |
| Relationships and Leadership | `brains/relationships/` | Who matters here, what do they need from you, and what conversation or move builds trust and gets it done? | networking, influence, persuasion, office politics, difficult conversation, conflict, feedback, co-founder issues, hiring, firing, managing people, team culture, team building, trust, communication |

Business absorbs the old Sales, Marketing and Growth departments. Its spine is Alex Hormozi's $100M series: Offer, Leads, Close, Money Model, Scale.

## Step 0: safety first

If the prompt mentions thoughts of suicide or self-harm, harming someone, abuse, a medical emergency, or severe symptoms, skip routing. Answer with care, point to immediate help (local emergency number, a crisis line such as 988 in the US and Canada or 116 123 in the UK and Ireland, or findahelpline.com), and follow the Safety section of `brains/psychology/_hot.md`. Do not give business or productivity advice in that answer.

## Step 1: score each department 0 to 3

- **3**: the question lives in this department (its owned question is the main thing being asked).
- **2**: the department is materially involved (the answer changes if you ignore it).
- **1**: touched at the edges.
- **0**: not involved.

Score on what the person needs decided, not on keywords alone. "I keep procrastinating on sales calls" may be Productivity (system), Mindset (fear), Psychology (anxiety) or Business (a weak offer that is hard to pitch). Ask: if only one department answered, what would be missing?

## Step 2: pick the mode

| Scores | Mode | What happens |
|---|---|---|
| One department at 3, every other at 1 or 0 | **Single** | Load that department only. The main agent answers in that advisor's shape. No subagents. |
| One at 3 and one or more at 2 | **Lead plus council** | Spawn every department scoring 2 or 3 as parallel subagents (at most three). The 3-scored department leads the synthesis. |
| Two or three at 2 or 3, none clearly leading | **Council** | Spawn those two or three as parallel subagents. The main agent synthesizes. |
| Four or five at 2 or more, or a whole-life or whole-business question ("review my business", "what should I fix first", "I feel stuck in everything") | **Full board** | Spawn the four highest scorers (all five only if the user asks with `--all`). |
| Everything at 0 or 1 (not a business or life question, or too vague to place) | **Clarify** | Ask one short question that would place it ("Is this about the business itself, your time, your head, or the people around you?"). If the user wants an answer anyway, run Full board. |

User overrides win: `--dept <name>` (Single on that department), `--depts a,b` (Council on those), `--all` (all five), `--solo` (no subagents: the main agent reads each chosen brain itself, one after another). Department names: business, productivity, mindset, psychology, relationships.

## Step 3: tell the user the routing in one line

Before answering, print one line, for example:
`Routing: Business 3, Mindset 2, Relationships 1, Productivity 0, Psychology 0. Lead plus council: Business leads, Mindset advises.`

## Examples

| Prompt | Scores (Bus, Prod, Mind, Psych, Rel) | Mode |
|---|---|---|
| "A prospect said we're too expensive. What do I say?" | 3, 0, 0, 0, 0 | Single: Business |
| "How do I build an offer people can't refuse?" | 3, 0, 0, 0, 0 | Single: Business |
| "How do I stop checking email all day?" | 0, 3, 0, 1, 0 | Single: Productivity |
| "I'm scared to raise my prices." | 2, 0, 3, 0, 0 | Lead plus council: Mindset leads, Business |
| "I'm exhausted and can't switch off at night." | 0, 1, 0, 3, 0 | Single: Psychology |
| "My co-founder and I keep fighting about money." | 1, 0, 0, 1, 3 | Single: Relationships |
| "How do I network without feeling fake?" | 0, 0, 2, 1, 3 | Lead plus council: Relationships leads, Mindset |
| "I'm burning out running a 10-person agency and the team keeps dropping balls." | 2, 2, 0, 3, 3 | Council: Psychology, Relationships, Business |
| "We get lots of leads but close very few." | 3, 0, 0, 0, 0 | Single: Business |
| "I want to quit my job and start a business but I'm terrified." | 2, 0, 3, 2, 0 | Lead plus council: Mindset leads, Business, Psychology |
| "Look at my business and my life and tell me what to fix first." | 3, 2, 2, 2, 2 | Full board |
| "What's a good book?" | 0, 0, 0, 0, 0 | Clarify |
