import { applyLayouts } from './utils/layout.util';
import { ScreenUtil } from './utils/screen.util';

Phoenix.set({
  openAtLogin: true,
});

Key.on('r', ['option', 'command'], () => {
  init(true);
});

function init(reload?: boolean) {
  Phoenix.notify(`${reload ? 'Reloaded' : 'Loaded'}. Applying Layouts...`);

  applyLayouts();
}

init();
