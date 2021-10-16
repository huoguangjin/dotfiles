#!/usr/bin/env osascript -l JavaScript

function run(argv) {
  const finder = Application('Finder');
  finder.includeStandardAdditions = true;

  const windows = finder.finderWindows();
  const folder = windows[0].target();
  const path = decodeURIComponent(folder.url()).slice(7); // remove "file://"
  // console.log(`url=${folder.url()} path=${path}`);

  const iTerm = Application('iTerm.app');
  iTerm.includeStandardAdditions = true;
  const window = iTerm.createWindowWithDefaultProfile();
  const session = window.currentSession;
  session.write({
    text: `cd "${path}" && clear`,
  });
}
