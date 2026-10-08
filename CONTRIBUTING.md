# 🤝 Contributing Guide

Thank you for contributing to the Git & GitHub Workshop! This guide explains
the rules for each round of the workshop.

---

## 📋 General Rules

1. **Be kind and respectful** in all comments and reviews.
2. Use **clear, descriptive commit messages** (e.g. `Add octocat` not `stuff`).
3. Only submit work that is your own.
4. If something is confunsing, ask in the workshop chat — we're all learning!

> ☝️ *Did you spot a typo above? There's an issue for that — go fix it!*

---

## 🟢 Round 1 — Your First Pull Request

**Goal:** Add your student file and get it merged.

### Rules

- Submit **one PR** per student.
- Your PR should add **exactly one new file**: `students/<your-github-username>.md`.
- Do **not** edit or delete anyone else's files.
- Use the template from [`students/README.md`](students/README.md).
- Fill in **all** the front-matter fields (name, github, bio, favourite).
- Your filename must match your GitHub username (lowercase is fine).

### What happens after you submit

1. A GitHub Action (`validate-pr`) checks your file automatically.
2. If the check fails, read the error message — it tells you exactly what to
   fix. Push a new commit to the same branch and the check re-runs.
3. The instructor reviews and merges your PR.
4. Once merged, the Class Wall rebuilds and your card appears! 🎉

---

## ⚔️ Round 2 — Merge Conflicts

**Goal:** Learn what merge conflicts are and how to resolve them.

### Setup

Everyone will edit the **same line** in
[`conflict-demo/motto.txt`](conflict-demo/motto.txt) at the same time.
The first PR merges cleanly — every PR after that will have a merge conflict.

### Steps

1. Make sure your fork is up to date:

   ```bash
   # Add the original repo as a remote (only once)
   git remote add upstream https://github.com/Cyberclutch146/git-github-workshop.git

   # Fetch and merge the latest changes
   git fetch upstream
   git checkout main
   git merge upstream/main
   ```

2. Create a new branch:

   ```bash
   git switch -c motto-<your-username>
   ```

3. Open `conflict-demo/motto.txt` and replace the motto with your own.
   Keep it to **one line**.

4. Commit and push:

   ```bash
   git add conflict-demo/motto.txt
   git commit -m "Update motto: <your-username>"
   git push -u origin motto-<your-username>
   ```

5. Open a PR. If someone else's motto was merged first, you'll see a
   **merge conflict**.

### How to Resolve a Merge Conflict

When Git can't automatically merge, it marks the conflict in the file like
this:

```
<<<<<<< HEAD
The motto that is currently on main
=======
Your version of the motto
>>>>>>> motto-your-username
```

Here's what each part means:

| Marker | Meaning |
|--------|---------|
| `<<<<<<< HEAD` | Start of the conflict — the version on `main` |
| `=======` | Separator between the two versions |
| `>>>>>>> branch-name` | End of the conflict — your version |

**To resolve it:**

1. Pull the latest `main` into your branch:

   ```bash
   git checkout motto-<your-username>
   git fetch upstream
   git merge upstream/main
   ```

2. Open `conflict-demo/motto.txt` in your editor.

3. **Delete** all three marker lines (`<<<<<<<`, `=======`, `>>>>>>>`).

4. Keep only the text you want — usually your version, or a combination.

5. Save the file, then:

   ```bash
   git add conflict-demo/motto.txt
   git commit -m "Resolve merge conflict for motto"
   git push
   ```

6. Your PR will update automatically. ✅

> **Tip:** Merge conflicts look scary but they're totally normal! Every
> developer deals with them. The key is: delete the markers, keep the right
> text, commit.

---

## 🏅 Bonus — Add yourself to CONTRIBUTORS.md

Once your Round 1 PR is merged, you can also add your name to
[`CONTRIBUTORS.md`](CONTRIBUTORS.md). Open a new PR for this!

---

## ❓ Questions?

Ask the instructor or post in the workshop chat. Happy coding! 🚀
