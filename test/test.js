const fs = require("fs");
const path = require("path");

// Test if required scripts exist
const scripts = [
  "scripts/linux_curl.sh",
  "scripts/macos_curl.sh",
  "scripts/windows_irm.ps1",
];

function testScripts() {
  let allPassed = true;

  scripts.forEach((script) => {
    const exists = fs.existsSync(script);
    console.log(`${script}: ${exists ? "✓" : "✗"}`);
    if (!exists) allPassed = false;
  });

  return allPassed;
}

// Run tests
console.log("Running tests...");
const result = testScripts();

if (result) {
  console.log("All tests passed!");
  process.exit(0);
} else {
  console.error("Some tests failed!");
  process.exit(1);
}
