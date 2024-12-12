export abstract class LoggingUtil {
  static init() {
    Event.on('windowDidFocus', (window) => {
      Phoenix.log(
        '[debug]',
        'windowDidFocus',
        window.app().name(),
        window.title()
      );
    });
    Event.on('appDidActivate', (app) => {
      Phoenix.log(
        '[debug]',
        'appDidActivate',
        app.name(),
        app.windows().map((w) => JSON.stringify(w.title()))
      );
    });
  }
}
