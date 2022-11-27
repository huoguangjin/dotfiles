#!/usr/bin/env osascript -l JavaScript

function run(argv) {
  const finder = Application('Finder');
  finder.includeStandardAdditions = true;

  const window = finder.windows[0];
  const bounds = window.bounds();

  const selections = finder.selection();
  let path;
  if (selections.length) {
    path = selections[0];
  } else {
    path = window.target();
  }

  const newWindow = finder.make({
    new: 'finderWindow',
    to: path,
  });

  bounds.x += 100;
  bounds.y += 50;
  newWindow.bounds = bounds;
}
