const BASE_PADDING = 8;
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
  debug: boolean;

  Padding: number;
  Screens: {
    [name: string]: ScreenConfig;
  };

  Plugins: {
    Layout: LayoutPluginConfig;
  };
}

export const Config: Config = {
  debug: true,

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
      // DELL 34"UWQHD
      id: '15C2B6FB-42BF-4608-81F2-6D8EE473BF66',
      padding: {
        top: PADDING_TOP + BASE_PADDING / 2,
        bottom: BASE_PADDING / 2,
        left: BASE_PADDING / 2,
        right: BASE_PADDING / 2,
      },
    },
    HomeSecondary: {
      // LG 27" 4K
      id: 'FA48D5BA-8216-430D-AA45-C1F4B65A7C8F',
      padding: {
        top: PADDING_TOP + BASE_PADDING / 2,
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
              height: 1,
            },
            {
              app: 'Microsoft Outlook',
              left: 0.5,
              top: 0,
              width: 0.5,
              height: 1,
            },
            // {
            //   app: 'Todoist',
            //   left: 0.0,
            //   top: 0,
            //   width: 1,
            //   height: 0.3,
            // },
          ],
        },
        {
          screen: () => Config.Screens.HomeSecondary,
          space: () => 1,
          windows: [],
        },
      ],
      // get: () => [
      //   {
      //     screen: () => Config.Screens.HomeSecondary,
      //     space: () => 0,
      //     windows: [
      //       {
      //         app: 'Microsoft Teams',
      //         left: 0.7,
      //         top: 0,
      //         width: 0.3,
      //         height: 0.6,
      //       },
      //       {
      //         app: 'Microsoft Teams (work or school)',
      //         left: 0.7,
      //         top: 0,
      //         width: 0.3,
      //         height: 1,
      //       },
      //       {
      //         app: 'Microsoft Outlook',
      //         left: 0.3,
      //         top: 0,
      //         width: 0.4,
      //         height: 1,
      //       },
      //       {
      //         app: 'Calendar',
      //         // app: 'Outlook (PWA) @ MW',
      //         left: 0.0,
      //         top: 0.6,
      //         width: 0.3,
      //         height: 0.4,
      //       },
      //       {
      //         app: 'Todoist',
      //         left: 0.0,
      //         top: 0,
      //         width: 0.3,
      //         height: 1,
      //       },
      //       // {
      //       //   app: 'Obsidian',
      //       //   left: 0.0,
      //       //   top: 0.5,
      //       //   width: 0.3,
      //       //   height: 0.5,
      //       // },
      //     ],
      //   },
      //   {
      //     screen: () => Config.Screens.HomeSecondary,
      //     space: () => 1,
      //     windows: [],
      //   },
      // ],
    },
  },
};
