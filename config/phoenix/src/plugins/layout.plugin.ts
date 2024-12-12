import { Config } from '../config';
import { ScreenUtil } from '../utils/screen.util';

export abstract class LayoutPlugin {
  static layoutOnAppStart() {
    Event.on('appDidLaunch', (launchedApp) => {
      Phoenix.log('[debug]', 'appDidLaunch', launchedApp.name());

      this.applyLayouts();
    });

    Event.on('windowDidOpen', (window) => {
      // Some windows need some time for their title to be set (e.g. iTerm2)
      setTimeout(() => {
        Phoenix.log(
          '[debug]',
          'windowDidOpen',
          window.title(),
          window.app().name()
        );
      }, 500);
    });
  }

  static applyLayouts(): void {
    const layouts = Config.Plugins.Layout.get();

    for (const layout of layouts) {
      const screen = ScreenUtil.getScreen([layout.screen().id]);
      if (!screen) continue;

      const space = screen.spaces()[layout.space()];
      const frame = ScreenUtil.getVisibleFrame(screen.identifier());
      if (!frame) return;

      for (const windowConfig of layout.windows) {
        let window: Window | undefined;

        if (windowConfig.title != null) {
          window = App.get(windowConfig.app)
            ?.windows()
            .find((w) => w.title().includes(windowConfig.title!));
        } else {
          window = App.get(windowConfig.app)?.mainWindow();
        }

        if (!window) continue;

        (space as any).moveWindows([window]);

        window.setFrame({
          x: frame.x + frame.width * windowConfig.left + Config.Padding / 2,
          y: frame.y + frame.height * windowConfig.top + Config.Padding / 2,
          width: frame.width * windowConfig.width - Config.Padding,
          height: frame.height * windowConfig.height - Config.Padding,
        });
      }
    }
  }
}

// function getPaddedFrame(screen: Screen): Rectangle {
//   const rawFrame = screen.flippedVisibleFrame();
//   return {
//     width: rawFrame.width - Config.Padding,
//     height: rawFrame.height - Config.Padding,
//     x: rawFrame.x + Config.Padding / 2,
//     y: rawFrame.y + Config.Padding / 2,
//   };
// }
