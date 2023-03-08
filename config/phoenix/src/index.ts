import { LayoutPlugin } from './plugins/layout.plugin';
import './plugins/window-size.plugin';

Phoenix.set({
  openAtLogin: true,
});

Key.on('r', ['command', 'option'], () => {
  init(true);
});

Key.on('r', ['command', 'shift', 'option'], () => {
  Phoenix.notify(`TEST`);
});

function init(reload?: boolean) {
  Phoenix.notify(`${reload ? 'Reloaded' : 'Loaded'}`);
  Phoenix.log(
    'available screens',
    Screen.all().map((screen) => screen.identifier())
  );

  LayoutPlugin.applyLayouts();

  // Following logic applies to restarts only
  if (reload) return;

  LayoutPlugin.layoutOnAppStart();
}

init();
