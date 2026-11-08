# 🎓 Git & GitHub Workshop

A hands-on repo where you learn Git by doing. Fork it, add your name, open a
PR — and watch your card appear on the
[**Class Wall**](https://git-github-workshop.vercel.app/)!

---

## 🚀 How to Contribute

### 1. Fork this repo

Click the **Fork** button (top-right of this page).

### 2. Clone your fork

```bash
git clone https://github.com/<your-username>/git-github-workshop.git
cd git-github-workshop
```

### 3. Create a branch

```bash
git switch -c add-<your-username>
```

### 4. Add your file

Create `students/<your-github-username>.md` using this template:

```markdown
---
name: Your Name
github: your-github-username
bio: One line about you
favourite: Your favourite language or tool
---
```

See [`students/example-student.md`](students/example-student.md) for a
completed example.

### 5. Commit and push

```bash
git add students/<your-github-username>.md
git commit -m "Add <your-username>"
git push -u origin add-<your-username>
```

### 6. Open a Pull Request

Go to your fork on GitHub → click **"Compare & pull request"** → submit!

### 🎉 Done!

Once merged, your card appears on the **Class Wall** automatically.

---

## 📖 Quick Glossary

| Term | Meaning |
|------|---------|
| **Fork** | Your own copy of this repo |
| **Clone** | Download the repo to your computer |
| **Branch** | A separate line of work |
| **Commit** | Save a snapshot of your changes |
| **Push** | Upload your commits to GitHub |
| **PR** | Ask to merge your changes into this repo |

---

## 🆘 Stuck?

- Run `git status` — it tells you what to do next.
- Ask in the workshop chat. No silly questions!

## 📄 License

[MIT](LICENSE)
