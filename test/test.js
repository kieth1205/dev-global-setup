const fs = require("fs");
const path = require("path");

// Test if required scripts exist and have correct content
const scripts = [
  {
    path: "scripts/linux_curl.sh",
    requiredContent: ["#!/bin/bash", "set -e", "curl -sSL"],
  },
  {
    path: "scripts/macos_curl.sh",
    requiredContent: ["#!/bin/bash", "set -e", "curl -sSL"],
  },
  {
    path: "scripts/windows_irm.ps1",
    requiredContent: [
      "$ErrorActionPreference",
      "Test-Administrator",
      "Invoke-WebRequest",
    ],
  },
];

function testScripts() {
  let allPassed = true;

  scripts.forEach((script) => {
    try {
      const exists = fs.existsSync(script.path);
      console.log(`\nChecking ${script.path}:`);
      console.log(`Exists: ${exists ? "✓" : "✗"}`);

      if (exists) {
        const content = fs.readFileSync(script.path, "utf8");
        script.requiredContent.forEach((required) => {
          const hasContent = content.includes(required);
          console.log(`Contains "${required}": ${hasContent ? "✓" : "✗"}`);
          if (!hasContent) allPassed = false;
        });
      } else {
        allPassed = false;
      }
    } catch (error) {
      console.error(`Error testing ${script.path}:`, error);
      allPassed = false;
    }
  });

  return allPassed;
}

// Run tests
console.log("Running tests...");
const result = testScripts();

if (result) {
  console.log("\nAll tests passed!");
  process.exit(0);
} else {
  console.error("\nSome tests failed!");
  process.exit(1);
}
