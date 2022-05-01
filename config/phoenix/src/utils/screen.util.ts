import { Config } from '../config';

export const ScreenUtil = {
  getScreen(screenIds: string[]): Screen | undefined {
    let screen: Screen | undefined;

    for (const screenId of screenIds) {
      screen = Screen.all().find((screen) => screen.identifier() === screenId);
      if (screen) return screen;
    }
  },

  getSecondary(): Screen {
    return Screen.all().filter(
      (screen) => screen.identifier() === Config.Screens.HomeSecondary.id
    )[0];
  },

  getVisibleFrame(screenId: string): Rectangle | undefined {
    const screen = this.getScreen([screenId]);
    if (!screen) return;

    const screenConfig = Object.values(Config.Screens).find(
      (screenConfig) => screenConfig.id === screenId
    );

    const frame = screen.flippedVisibleFrame();

    return {
      width:
        frame.width -
        (screenConfig?.padding?.left ?? 0) -
        (screenConfig?.padding?.right ?? 0),
      height:
        frame.height -
        (screenConfig?.padding?.top ?? 0) -
        (screenConfig?.padding?.bottom ?? 0),
      x: frame.x + (screenConfig?.padding?.left ?? 0),
      y: frame.y + (screenConfig?.padding?.top ?? 0),
    };
  },
};
