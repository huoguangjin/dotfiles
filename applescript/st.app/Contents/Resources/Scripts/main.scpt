JsOsaDAS1.001.00bplist00�Vscript_�#!/usr/bin/env osascript -l JavaScript

function run(argv) {
  const finder = Application('Finder');
  finder.includeStandardAdditions = true;

  const windows = finder.finderWindows();
  const folder = windows[0].target();
  const dir = decodeURIComponent(folder.url()).slice(7);

  const files = finder.selection().map(s => {
    const file = decodeURIComponent(s.url()).slice(7);
    return `"${file}"`;
  });
  // console.log(`dir=${dir} files=${files}`);

  const app = Application.currentApplication();
  app.includeStandardAdditions = true;

  const exe = "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl";
  const cmd = `"${exe}" -n "${dir}" ${files.join(' ')}`;
  // console.log(`cmd=${cmd}`);
  app.doShellScript(cmd);
}
                               jscr  ��ޭ