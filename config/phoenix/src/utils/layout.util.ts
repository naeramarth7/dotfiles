import { Config } from '../config';
import { ScreenUtil } from './screen.util';

export function applyLayouts() {
  const layouts = Config.getLayouts();

  for (const layout of layouts) {
    const screen = ScreenUtil.getScreen([layout.screen()]);
    if (!screen) continue;

    const space = screen.spaces()[layout.space()];
    const frame = getPaddedFrame(screen);

    for (const windowConfig of layout.windows) {
      const window = App.get(windowConfig.app)?.mainWindow();
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

function getPaddedFrame(screen: Screen): Rectangle {
  const rawFrame = screen.flippedVisibleFrame();
  return {
    width: rawFrame.width - Config.Padding,
    height: rawFrame.height - Config.Padding,
    x: rawFrame.x + Config.Padding / 2,
    y: rawFrame.y + Config.Padding / 2,
  };
}
