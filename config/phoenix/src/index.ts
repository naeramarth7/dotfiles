import { LoggingUtil } from './utils/logging.util';
import { LayoutPlugin } from './plugins/layout.plugin';
import './plugins/window-size.plugin';
import { Config } from './config';

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

  if (Config.debug) {
    LoggingUtil.init();
  }

  LayoutPlugin.layoutOnAppStart();
}

init();
