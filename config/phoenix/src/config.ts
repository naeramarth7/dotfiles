interface LayoutConfig {
  screen: () => string;
  space: () => number;
  windows: WindowConfig[];
}

interface WindowConfig {
  app: string;
  left: number;
  top: number;
  width: number;
  height: number;
  paddings: {
    vertical: number;
    horizontal: number;
  };
}

export const Config = {
  Padding: 16,
  Screens: {
    HomePrimary: 'AB53BDB6-E914-0CE0-20CF-6AD691E72368',
    HomeSecondary: 'AD63C53E-0DD0-4967-BAEB-BEB3128738F3',
  },

  getLayouts: (): LayoutConfig[] => [
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
          paddings: { vertical: 3, horizontal: 3 },
        },
        {
          app: 'Microsoft Outlook',
          left: 0.5,
          top: 0,
          width: 0.5,
          height: 0.6,
          paddings: { vertical: 3, horizontal: 3 },
        },
        {
          app: 'Teams @ BMW',
          left: 0,
          top: 0.5,
          width: 0.5,
          height: 0.5,
          paddings: { vertical: 3, horizontal: 3 },
        },
        {
          app: 'OBS',
          left: 0.5,
          top: 0.6,
          width: 0.5,
          height: 0.4,
          paddings: { vertical: 3, horizontal: 3 },
        },
      ],
    },
  ],
};
