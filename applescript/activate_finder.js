#!/usr/bin/env osascript -l JavaScript

// Automator > File > New > Quick Action > Drag Run JavaScript, Edit and Save
function run(argv) {
  const app = Application('Finder');
  app.includeStandardAdditions = true;

  app.activate();
}
