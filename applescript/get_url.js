#!/usr/bin/env osascript -l JavaScript

function run() {
  const chrome = Application('Google Chrome');
  const window = chrome.windows()[0];
  const tab = window.activeTab();
  const title = tab.title();
  const url = tab.url();

  return title + '\n' + url;
}
