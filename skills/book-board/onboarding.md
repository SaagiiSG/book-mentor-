# Onboarding: know the person, audit their life, build the artifact

Run this the first time the board is used in a conversation, or when the user asks to start, onboard, or audit ("эхлэх", "танилцах", "аудит", "амьдралаа үнэлүүлэх", "/book-board" with no question). If the user arrives with a specific question, do Phase 1 silently, answer the question with that context, and offer the audit at the end in one line.

Everything the user sees is in Mongolian (see `language.md`).

## Phase 1: gather context in the background

Do this silently. Tell the user one line only, for example: "Таны талаар мэдээлэл цуглуулж байна..." Then use whatever this environment offers, in this order, and stop as soon as you have enough:

1. **What the user already said** in this conversation, and any files they attached.
2. **Memory and past chats** (Claude.ai and the Claude app): the user's saved memory and preferences, then the past-chats search tools if available. Search for: business, company, job, revenue, team, goals, health, sleep, family, stress, and the user's own words in Mongolian (бизнес, ажил, орлого, баг, зорилго, стресс). Read only what is relevant; never quote private past chats back at length.
3. **Project knowledge** if the chat is inside a Project.
4. **Claude Code only:** a saved profile at `~/.claude/book-board/profile.md`, the project's `CLAUDE.md` and README. If an Agent tool exists, you may run this scan as a background subagent and continue talking to the user meanwhile.

Fill the profile below. Never invent a field. Mark each field with its source ("ярианаас", "санах ойгоос", "өмнөх чатаас").

### Profile fields

| # | Field | Example |
|---|---|---|
| 1 | Role and work | founder of a 6-person agency, 3 years |
| 2 | Business model and offer | social media retainers, 2,500,000 MNT per month |
| 3 | Scale | revenue per month, number of clients, team size |
| 4 | Main goal for the next 12 months | double revenue, work fewer hours |
| 5 | Main problem right now | leads but low close rate |
| 6 | Time | hours worked per week, where time goes |
| 7 | Mind | biggest internal blocker (fear, doubt, procrastination, motivation) |
| 8 | Wellbeing | sleep hours, stress, energy, mood (self-reported, never diagnosed) |
| 9 | People | hardest relationship or conversation (team, partner, family, network) |
| 10 | Capacity | hours per week they can give to change |

## Phase 2: decide what to ask

- **6 or more fields known:** show a short summary in Mongolian ("Би таны талаар ингэж ойлгосон:" then 4 to 6 bullets), ask the user to confirm or correct, and ask only the missing questions (at most 3). Then go to Phase 4.
- **Fewer than 6 known:** run the audit in Phase 3.

If a tool for interactive questions with options is available, use it for the score questions; otherwise ask in plain numbered messages. One round per message. Tell the user they can skip any question ("Хүсэхгүй асуултаа алгасаж болно.").

## Phase 3: the life audit (3 short rounds)

Ask in Mongolian, exactly in this spirit. Adapt wording to what you already know; skip what is already answered.

**Эхний шат: Та ба таны ажил**

Нэг хоёр өгүүлбэрээр хариулахад хангалттай.

1. Та юу хийдэг вэ? Бизнес эсвэл ажил, салбар, хэдэн жил болж байгаа вэ?
2. Бизнесийн хэмжээ: сарын орлого ойролцоогоор, хэдэн хүнтэй баг, гол бүтээгдэхүүн эсвэл үйлчилгээ, үнэ нь хэд вэ?
3. Яг одоо таныг хамгийн их бодогдуулж байгаа нэг хоёр асуудал юу вэ?
4. 12 сарын дараа юу өөрчлөгдсөн байвал та "энэ жил амжилттай болсон" гэж хэлэх вэ?

**Хоёр дахь шат: Таван чиглэлийн үнэлгээ**

Өөрийгөө 1-ээс 10 хүртэл оноогоор үнэлээрэй, тэгээд нэг өгүүлбэр нэмээрэй.

5. Бизнес: санал (offer), хэрэглэгч татах, борлуулалт, мөнгөний загвар, өсөлт. Аль нь хамгийн сул байна вэ?
6. Бүтээмж: долоо хоногт хэдэн цаг ажилладаг вэ, үүний хэдэн хувь нь үнэхээр чухал ажилд зарцуулагддаг вэ?
7. Сэтгэлгээ: таныг хамгийн их саатуулдаг зүйл юу вэ? Айдас, эргэлзээ, хойшлуулалт эсвэл урам зориг буурах?
8. Сэтгэл санаа ба эрүүл мэнд: сүүлийн хоёр долоо хоногт нойр, стресс, эрч хүчээ хэрхэн үнэлэх вэ? Шөнө дунджаар хэдэн цаг унтдаг вэ?
9. Харилцаа ба манлайлал: баг, хамтрагч, гэр бүл, танил тал. Аль харилцаа хамгийн хэцүү байна вэ?

**Гурав дахь шат: Гүнзгийрүүлэх**

10. Сүүлийн зургаан сард хамгийн том ялалт тань юу байсан бэ?
11. Ямар яриа эсвэл шийдвэрийг хойшлуулж байна вэ?
12. Энэ төлөвлөгөөг хэрэгжүүлэхэд долоо хоногт хэдэн цаг гаргаж чадах вэ?

### Safety during the audit

If any answer mentions thoughts of suicide or self-harm, harming someone, abuse, or severe symptoms (not sleeping for days, unable to function), stop the audit and follow the Safety section of `brains/psychology/_hot.md` with the Mongolian numbers in `language.md`. Low self-scores alone are not a crisis: never pathologize them.

## Phase 4: analyse with the board

1. Read the five `_hot.md` files (business, productivity, mindset, psychology, relationships) and `brains/business/spine.md`.
2. For each department: final score 1 to 10 (start from the user's own score; adjust by at most 2 points with a one-line reason drawn from their answers), the main constraint in one line, the evidence from their answers, and the one framework and book that fits (with book id).
3. Pick the **top 3 priorities across the whole life**, in order. Rule of thumb: crisis-level wellbeing comes first; then the department whose constraint blocks the others (for example burnout blocks everything, a weak offer blocks leads and sales). Explain the order in one line.
4. Build a **30-day plan**: 4 weeks, 2 to 4 concrete actions per week, each tagged with its department, sized to the hours they said they can give.
5. Pick **3 books to start with** (one per priority) and **3 questions to ask the board next**.

## Phase 5: build the artifact

Build the life audit dashboard from `assets/life-audit.html`: copy it, fill the `DATA` object with the results (in Mongolian), and keep the layout.

- **Claude.ai or the Claude app:** create it as an HTML artifact so it renders in the chat.
- **Claude Code:** write it as `life-audit.html` in the current folder (or publish it with an artifact tool if one is available) and give the path.

Then, in chat, in Mongolian: two or three sentences on the biggest insight, and the first action to do today. Offer: "Дараагийн асуултаа шууд асуугаарай. Би таны мэдээллийг ашиглан зөвлөлийг ажиллуулна."

## Phase 6: keep the profile

- Keep the profile in mind for the rest of the conversation: every later answer uses it.
- The artifact contains a "Профайл" block the user can copy into a new chat to skip onboarding next time.
- **Claude Code:** ask once whether to save it to `~/.claude/book-board/profile.md`.
- **Claude.ai:** if memory is on, the important facts may be remembered automatically; do not promise it.
