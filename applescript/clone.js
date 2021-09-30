#!/usr/bin/env osascript -l JavaScript

function run(argv) {
  const finder = Application('Finder');
  finder.includeStandardAdditions = true;

  const selections = finder.selection();

  finder.make({
    new: 'finderWindow',
    to: selections[0],
  });
}
