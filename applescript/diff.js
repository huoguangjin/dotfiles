#!/usr/bin/env osascript -l JavaScript

function run(argv) {
  const finder = Application('Finder');
  finder.includeStandardAdditions = true;

  const files = finder.selection().map(s => {
    const file = decodeURIComponent(s.url()).slice(7);
    return `"${file}"`;
  });
  // console.log(`files=${files}`);

  if (files.length !== 2) {
    return;
  }

  const app = Application.currentApplication();
  app.includeStandardAdditions = true;

  const exe = "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge";
  const cmd = `"${exe}" mergetool ${files.join(' ')}`;
  // console.log(`cmd=${cmd}`);
  app.doShellScript(cmd);
}
