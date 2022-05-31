const BASE_PADDING = 16;

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
    HomePrimary: {
      id: 'AB53BDB6-E914-0CE0-20CF-6AD691E72368',
      padding: {
        top: 40,
        bottom: BASE_PADDING / 2,
        left: BASE_PADDING / 2,
        right: BASE_PADDING / 2,
      },
    },
    HomeSecondary: {
      id: 'AD63C53E-0DD0-4967-BAEB-BEB3128738F3',
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
              left: 0,
              top: 0,
              width: 0.5,
              height: 0.5,
            },
            {
              app: 'Microsoft Outlook',
              left: 0.5,
              top: 0,
              width: 0.5,
              height: 0.6,
            },
            {
              app: 'Teams @ BMW',
              left: 0,
              top: 0.5,
              width: 0.5,
              height: 0.5,
            },
            {
              app: 'OBS',
              left: 0.5,
              top: 0.6,
              width: 0.5,
              height: 0.4,
            },
          ],
        },
        {
          screen: () => Config.Screens.HomeSecondary,
          space: () => 1,
          windows: [
            {
              app: 'TIDAL',
              left: 0,
              top: 0,
              width: 0.4,
              height: 0.7,
            },
            {
              app: 'iTerm2',
              title: 'cava',
              left: 0.0,
              top: 0.7,
              width: 0.4,
              height: 0.3,
            },
            {
              app: 'KeePassXC',
              left: 0.7,
              top: 0.5,
              width: 0.3,
              height: 0.5,
            },
          ],
        },
      ],
    },
  },
};
