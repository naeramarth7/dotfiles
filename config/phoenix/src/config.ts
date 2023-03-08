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
      // id: '53124973-3EBB-45BA-84B9-BB4412F69C76',
      id: 'D05A44D5-4E48-49C6-AA25-41534CF511E0',
      padding: {
        top: PADDING_TOP + BASE_PADDING / 2,
        bottom: BASE_PADDING / 2,
        left: BASE_PADDING / 2,
        right: BASE_PADDING / 2,
      },
    },
    HomeSecondary: {
      // id: '9BE5303B-263F-EB1F-2E49-FCA70AB4AAF5',
      id: '2D42421D-9549-495F-855B-F906344E9BFF',
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
