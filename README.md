# 🎓 Git & GitHub Workshop

Welcome! This is a **hands-on practice repository** for learning Git and GitHub.
By the end of this workshop you will have forked a repo, created a branch,
made commits, pushed code, and opened a pull request — the core skills every
developer uses daily.

> **No experience required.** Follow the steps below and ask in the chat if
> you get stuck!

---

## 🚀 Student Workflow (Round 1 — Your first PR)

### Step 1 — Fork this repo

Click the **Fork** button at the top-right of this page. This creates your
own copy of the repo under your GitHub account.

### Step 2 — Clone YOUR fork

```bash
git clone https://github.com/<your-username>/git-github-workshop.git
```

Replace `<your-username>` with your actual GitHub username.

### Step 3 — Enter the folder & create a branch

```bash
cd git-github-workshop
git switch -c add-<your-username>
```

For example: `git switch -c add-octocat`

### Step 4 — Add your student file

Create a new file called `students/<your-github-username>.md`.
Copy the template from [`students/README.md`](students/README.md) and fill it
in. Check [`students/example-student.md`](students/example-student.md) for
a completed example.

### Step 5 — Stage and commit

```bash
git status            # see what changed
git add students/<your-github-username>.md
git commit -m "Add <your-username>"
```

### Step 6 — Push your branch

```bash
git push -u origin add-<your-username>
```

### Step 7 — Open a Pull Request

Go to **your fork** on GitHub. You should see a banner saying
*"Compare & pull request"*. Click it, fill in the PR template, and submit!

Or use the CLI:

```bash
gh pr create --title "Add <your-username>" --body "My first PR! 🎉"
```

### 🎉 Done!

Wait for the instructor to review and merge your PR.
Once merged your card will appear on the **Class Wall**! 🧱

---

## 🧱 Class Wall

After your PR is merged, a GitHub Action rebuilds the
[**Class Wall**](https://Cyberclutch146.github.io/git-github-workshop/) —
a web page that shows every student's card.

> **Enabling Pages:** The repo owner needs to go to
> **Settings → Pages → Build and deployment** and select **GitHub Actions**
> as the source. The wall will be live at
> `https://Cyberclutch146.github.io/git-github-workshop/`.

---

## ⚔️ Round 2 — Merge Conflicts

In Round 2, every student edits the **same line** in
[`conflict-demo/motto.txt`](conflict-demo/motto.txt). This creates merge
conflicts on purpose so you can practise resolving them.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the step-by-step guide.

---

## 📖 Glossary

| Term       | What it means |
|------------|---------------|
| **Fork**   | Your personal copy of someone else's repo on GitHub. |
| **Clone**  | Downloading a repo from GitHub to your computer. |
| **Branch** | A parallel line of work. You create one so your changes don't affect `main` until you're ready. |
| **Commit** | A snapshot of your changes, with a message describing what you did. |
| **Push**   | Uploading your commits from your computer to GitHub. |
| **PR** (Pull Request) | A request to merge your branch into the original repo. Others can review your changes first. |

---

## 🆘 Stuck? Ask in chat!

- Re-read the step you're on — most errors come from a small typo.
- Run `git status` — it usually tells you what to do next.
- Ask your neighbour or post in the workshop chat. **There are no silly
  questions!**
- Check the [GitHub Docs](https://docs.github.com/en/get-started) for
  reference.

