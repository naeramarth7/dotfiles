import { LayoutPlugin } from './plugins/layout.plugin';
import './plugins/window-size.plugin';

Phoenix.set({
  openAtLogin: true,
});

Key.on('r', ['command', 'option'], () => {
  init(true);
});

function init(reload?: boolean) {
  Phoenix.notify(`${reload ? 'Reloaded' : 'Loaded'}`);

  LayoutPlugin.applyLayouts();

  // Following logic applies to restarts only
  if (reload) return;

  LayoutPlugin.layoutOnAppStart();
}

init();
