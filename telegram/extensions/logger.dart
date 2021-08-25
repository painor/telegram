dynamic _level = null;

class Logger {
  static const levels = ['error', 'warn', 'info', 'debug'];
  final colors = {
    "start": '\x1b[2m',
    'warn': '\x1b[35m',
    'info': '\x1b[33m',
    'debug': '\x1b[36m',
    'error': '\x1b[31m',
    'end': '\x1b[0m',
  };
  final String messageFormat = '[%t] [%l] - [%m]';

  Logger({String level: 'debug'}) {
    if (_level == null) {
      _level = 'debug';
    }
  }

  /**
   *
   * @param level {string}
   * @returns {boolean}
   */
  bool canSend(String level) {
    return (Logger.levels.indexOf(_level) >= Logger.levels.indexOf(level));
  }

  /**
   * @param message {string}
   */
  void warn(String message) {
    this._log('warn', message, this.colors['warn']);
  }

  /**
   * @param message {string}
   */
  void info(String message) {
    this._log('info', message, this.colors['info']);
  }

  /**
   * @param message {string}
   */
  void debug(String message) {
    this._log('debug', message, this.colors['debug']);
  }

  /**
   * @param message {string}
   */
  void error(String message) {
    this._log('error', message, this.colors['error']);
  }

  String format(String message, String level) {
    return this
        .messageFormat
        .replaceFirst('%t', new DateTime.now().toIso8601String())
        .replaceFirst('%l', level.toUpperCase())
        .replaceFirst('%m', message);
  }

  static void setLevel(String level) {
    _level = level;
  }

  /**
   * @param level {string}
   * @param message {string}
   * @param color {string}
   */
  void _log(String level, String message, String? color) {
    if (_level == null) {
      return;
    }
    if (this.canSend(level)) {
      print(color! + this.format(message, level) + this.colors['end']!);
    }
  }
}

void main() {
  var log = new Logger(level: "debug");
  log.error("error");
  log.warn("warn");
  log.info("info");
  log.debug("debug");
}
