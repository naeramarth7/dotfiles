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
      id: '2D42421D-9549-495F-855B-F906344E9BFF',
      padding: {
        top: PADDING_TOP + BASE_PADDING / 2,
        bottom: BASE_PADDING / 2,
        left: BASE_PADDING / 2,
        right: BASE_PADDING / 2,
      },
    },
    HomeSecondary: {
      // DELL 34"UWQHD
      // id: 'D05A44D5-4E48-49C6-AA25-41534CF511E0',
      // LG 27" 4K
      id: 'FA48D5BA-8216-430D-AA45-C1F4B65A7C8F',
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
              width: 1,
              height: 0.5,
            },
            {
              app: 'Microsoft Teams (work or school)',
              left: 0,
              top: 0.0,
              width: 1,
              height: 0.5,
            },
            {
              app: 'Microsoft Outlook',
              left: 0,
              top: 0.5,
              width: 1,
              height: 0.5,
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
