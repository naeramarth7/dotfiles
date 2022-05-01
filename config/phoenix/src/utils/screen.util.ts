import { Config } from '../config';

export const ScreenUtil = {
  getScreen(uuids: string[]): Screen | undefined {
    let screen: Screen | undefined;

    for (const uuid of uuids) {
      screen = Screen.all().find((screen) => screen.identifier() === uuid);
      if (screen) return screen;
    }
  },

  getSecondary(): Screen {
    return Screen.all().filter(
      (screen) => screen.identifier() === Config.Screens.HomeSecondary
    )[0];
  },
};
