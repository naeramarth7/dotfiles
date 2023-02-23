import { ScreenUtil } from '../utils/screen.util';
import { Config } from '../config';

interface WindowPositionConfig {
  originalFrame: Rectangle;
  inSpecialPosition: boolean;
}

const WindowPositions = new Map<number, WindowPositionConfig>();

// Maximize
Key.on('up', ['command', 'option'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: visibleFrame.width - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Left 1/3
Key.on('left', ['command', 'option', 'control'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: (visibleFrame.width / 3) * 1 - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Left 1/2
Key.on('left', ['command', 'option'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: visibleFrame.width / 2 - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Left 2/3
Key.on('left', ['command', 'option', 'shift'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: (visibleFrame.width / 3) * 2 - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Right 1/3
Key.on('right', ['command', 'option', 'control'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + (visibleFrame.width / 3) * 2 + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: (visibleFrame.width / 3) * 1 - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Right 1/2
Key.on('right', ['command', 'option'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + visibleFrame.width / 2 + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: visibleFrame.width / 2 - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Right 2/3
Key.on('right', ['command', 'option', 'shift'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + visibleFrame.width / 3 + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: (visibleFrame.width / 3) * 2 - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Center 1/3
Key.on('down', ['command', 'option', 'ctrl'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + visibleFrame.width / 3 + Config.Padding / 2,
    y: visibleFrame.y + Config.Padding / 2,
    width: (visibleFrame.width / 3) * 1 - Config.Padding,
    height: visibleFrame.height - Config.Padding,
  });
});

// Centralize
Key.on('up', ['command', 'option', 'control'], () => {
  const currentWindow = getCurrentWindow(true);
  if (!currentWindow) return;

  const { window, visibleFrame } = currentWindow;

  window.setFrame({
    x: visibleFrame.x + visibleFrame.width * 0.1 + Config.Padding / 2,
    y: visibleFrame.y + visibleFrame.height * 0.1 + Config.Padding / 2,
    width: visibleFrame.width * 0.8 - Config.Padding,
    height: visibleFrame.height * 0.8 - Config.Padding,
  });
});

// Restore
Key.on('down', ['command', 'option'], () => {
  const window = Window.focused();
  if (!window) return;

  const { originalFrame } = WindowPositions.get(window.hash()) ?? {};
  if (!originalFrame) return;

  WindowPositions.set(window.hash(), {
    originalFrame,
    inSpecialPosition: false,
  });
  window.setFrame(originalFrame);
});

function getCurrentWindow(
  storeFrame: boolean
): { window: Window; screen: Screen; visibleFrame: Rectangle } | undefined {
  const window = Window.focused();
  if (!window) return;

  const screen = window.screen();
  if (!screen) return;

  const visibleFrame = ScreenUtil.getVisibleFrame(screen.identifier());
  if (!visibleFrame) return;

  const { inSpecialPosition } = WindowPositions.get(window.hash()) ?? {};
  if (storeFrame && !inSpecialPosition) {
    WindowPositions.set(window.hash(), {
      originalFrame: window.frame(),
      inSpecialPosition: true,
    });
  }

  return { window, screen, visibleFrame };
}
