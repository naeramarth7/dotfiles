const BASE_PADDING = 16;
const PADDING_TOP = 0;

interface LayoutConfig {
  screen: () => ScreenConfig;
  space: () => number;
  windows: WindowConfig[];
}

interface WindowConfig {
  app: string;
  title?: string;
  left: number;
  top: number;
  width: number;
  height: number;
}

export interface ScreenConfig {
  id: string;
  padding?: {
    top?: number;
    bottom?: number;
    left?: number;
    right?: number;
  };
}

interface LayoutPluginConfig {
  get: () => LayoutConfig[];
}

interface Config {
  Padding: number;
  Screens: {
    [name: string]: ScreenConfig;
  };

  Plugins: {
    Layout: LayoutPluginConfig;
  };
}

export const Config: Config = {
  Padding: BASE_PADDING,
  Screens: {
    MacBook: {
      id: '872C9ADB-3AAF-A65E-7A86-53C6A0B3E936',
      padding: {
        top: PADDING_TOP + BASE_PADDING / 2,
        bottom: BASE_PADDING / 2,
        left: BASE_PADDING / 2,
        right: BASE_PADDING / 2,
      },
    },
    HomePrimary: {
      id: 'E16D1EF7-7FEF-4C66-B648-3F9DC1F955E9',
      padding: {
        top: PADDING_TOP + BASE_PADDING / 2,
        bottom: BASE_PADDING / 2,
        left: BASE_PADDING / 2,
        right: BASE_PADDING / 2,
      },
    },
    HomeSecondary: {
      id: '15C2B6FB-42BF-4608-81F2-6D8EE473BF66',
      padding: {
        top: BASE_PADDING / 2,
        bottom: BASE_PADDING / 2,
        left: BASE_PADDING / 2,
        right: BASE_PADDING / 2,
      },
    },
  },

  Plugins: {
    Layout: {
      get: () => [
        {
          screen: () => Config.Screens.HomeSecondary,
          space: () => 0,
          windows: [
            {
              app: 'Microsoft Teams',
              left: 0.3,
              top: 0,
              width: 0.3,
              height: 0.6,
            },
            {
              app: 'Teams @ BMW',
              left: 0,
              top: 0,
              width: 0.3,
              height: 0.6,
            },
            {
              app: 'Microsoft Outlook',
              left: 0.6,
              top: 0,
              width: 0.4,
              height: 0.6,
            },
            {
              app: 'OBS',
              left: 0.0,
              top: 0.6,
              width: 0.3,
              height: 0.4,
            },
            {
              app: 'TIDAL',
              left: 0.6,
              top: 0.6,
              width: 0.4,
              height: 0.4,
            },
            {
              app: 'KeePassXC',
              left: 0.3,
              top: 0.6,
              width: 0.3,
              height: 0.4,
            },
            {
              app: 'Reminders',
              left: 0.6,
              top: 0.6,
              width: 0.2,
              height: 0.4,
            },
            {
              app: 'Plexamp',
              left: 0.8,
              top: 0.6,
              width: 0.2,
              height: 0.4,
            },
          ],
        },
        {
          screen: () => Config.Screens.HomeSecondary,
          space: () => 1,
          windows: [],
        },
      ],
    },
  },
};
