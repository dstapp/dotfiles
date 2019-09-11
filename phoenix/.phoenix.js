Phoenix.set({
  // daemon: true,
  openAtLogin: true
});

const MOD = [ 'ctrl', 'alt' ];

function moveWindow(rect, screen, window) {
  window = window || Window.focused();
  screen = screen || window.screen();

  const scr = screen.visibleFrameInRectangle();

  const r = {
    x: Math.round(scr.x + rect.x * scr.width),
    y: Math.round(scr.y + rect.y * scr.height),
    width: Math.round(scr.width * rect.width),
    height: Math.round(scr.height * rect.height),
  };

  window.setFrame(r);
}

function moveWindowToNextScreen() {
  const currW = Window.focused();
  const cwFrame = currW.frame();
  const currScreen = currW.screen();
  const nextScreen = currScreen.next();

  console.log(currScreen, nextScreen);

  const currScreenSize = currScreen.visibleFrameInRectangle();

  const relative = {
    x: (cwFrame.x - currScreenSize.x) / currScreenSize.width,
    y: (cwFrame.y - currScreenSize.y) / currScreenSize.height,
    width: cwFrame.width / currScreenSize.width,
    height: cwFrame.height / currScreenSize.height,
  };

  moveWindow(relative, nextScreen);
}

// Phoenix.notify('foo');
// console.log('hi');
  // App.launch('Safari').focus();

Key.on('left', MOD, () => {
  moveWindow({ x: 0, y: 0, width: 0.5, height: 1.0 });
});

Key.on('right', MOD, () => {
  moveWindow({ x: 0.5, y: 0, width: 0.5, height: 1.0 });
});

Key.on('return', MOD, () => {
  moveWindow({ x: 0, y: 0, width: 1, height: 1 });
});

Key.on('n', MOD, () => {
  moveWindowToNextScreen();
});

Key.on('<', MOD, () => {
  App.launch('Google Chrome').focus();
});

Event.on('windowDidOpen', (window) => {
  if (!window.isNormal()) {
    return;
  }

  const name = window.app().name();
  Phoenix.notify(name);

  // if (!/Google Chrome/.test(name)) return;
  // Phoenix.notify('1');
  // const title = window.title();
  // if (/(chrome-devtools)|(Developer Tools - )/.test(title)) return;
  // moveWindow({x: 0, y: 0, width: 0.5, height: 1.0}, Screen.call()[0], window);
});

Phoenix.notify('Config loaded');
