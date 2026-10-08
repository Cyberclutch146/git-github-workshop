/*
 * ============================================================
 * build.js — Class Wall Data Generator
 * ============================================================
 *
 * This script reads every student Markdown file in the
 * ../students/ folder, parses the YAML front matter, and
 * writes the result to wall/data.json.
 *
 * How it works:
 *   1. Scan the students/ directory for .md files.
 *   2. Skip README.md and example-student.md.
 *   3. For each remaining file, extract the front matter
 *      (the block between the --- lines at the top).
 *   4. Build a JSON array of student objects.
 *   5. Write the array to data.json in this folder.
 *
 * Usage:
 *   node wall/build.js
 *
 * No external dependencies — only Node built-ins are used.
 * ============================================================
 */

const fs = require('fs');
const path = require('path');

// ---------- Configuration ----------

// Path to the students directory (relative to project root)
const STUDENTS_DIR = path.join(__dirname, '..', 'students');

// Output file
const OUTPUT_FILE = path.join(__dirname, 'data.json');

// Files to skip (not real student files)
const SKIP_FILES = ['README.md', 'example-student.md'];

// ---------- Front-matter parser ----------

/**
 * Parses simple YAML front matter from a Markdown string.
 * Expects a block like:
 *   ---
 *   key: value
 *   ---
 *
 * Returns an object with the key-value pairs, or null if
 * no front matter is found.
 */
function parseFrontMatter(content) {
  // Check that the file starts with ---
  if (!content.startsWith('---')) {
    return null;
  }

  // Find the closing ---
  const endIndex = content.indexOf('---', 3);
  if (endIndex === -1) {
    return null;
  }

  // Extract the front-matter block (between the two --- lines)
  const frontMatterBlock = content.substring(3, endIndex).trim();

  // Parse each line as "key: value"
  const data = {};
  const lines = frontMatterBlock.split('\n');

  for (const line of lines) {
    const colonIndex = line.indexOf(':');
    if (colonIndex === -1) continue;

    const key = line.substring(0, colonIndex).trim().toLowerCase();
    const value = line.substring(colonIndex + 1).trim();

    if (key && value) {
      data[key] = value;
    }
  }

  return data;
}

// ---------- Main ----------

function main() {
  console.log('🧱 Building Class Wall data...\n');

  // Check that the students directory exists
  if (!fs.existsSync(STUDENTS_DIR)) {
    console.error('❌ Students directory not found:', STUDENTS_DIR);
    process.exit(1);
  }

  // Read all .md files in the students directory
  const files = fs.readdirSync(STUDENTS_DIR).filter(function (file) {
    return file.endsWith('.md') && !SKIP_FILES.includes(file);
  });

  console.log('📂 Found ' + files.length + ' student file(s).\n');

  // Parse each file
  const students = [];

  for (const file of files) {
    const filePath = path.join(STUDENTS_DIR, file);
    const content = fs.readFileSync(filePath, 'utf-8');
    const data = parseFrontMatter(content);

    if (!data) {
      console.warn('⚠️  Skipping ' + file + ' — no front matter found.');
      continue;
    }

    // Check required fields
    const required = ['name', 'github', 'bio', 'favourite'];
    const missing = required.filter(function (key) {
      return !data[key];
    });

    if (missing.length > 0) {
      console.warn(
        '⚠️  Skipping ' + file + ' — missing fields: ' + missing.join(', ')
      );
      continue;
    }

    students.push({
      name: data.name,
      github: data.github,
      bio: data.bio,
      favourite: data.favourite,
    });

    console.log('  ✅ ' + data.name + ' (@' + data.github + ')');
  }

  // Sort alphabetically by name
  students.sort(function (a, b) {
    return a.name.localeCompare(b.name);
  });

  // Write the output
  const json = JSON.stringify(students, null, 2);
  fs.writeFileSync(OUTPUT_FILE, json + '\n', 'utf-8');

  console.log('\n✨ Done! Wrote ' + students.length + ' student(s) to data.json');
}

main();
