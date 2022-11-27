#!/usr/bin/env osascript -l JavaScript

// Automator > File > New > Quick Action > Drag Run JavaScript, Edit and Save
function run(argv) {
  const app = Application('iTerm');
  app.includeStandardAdditions = true;

  app.activate();
}
