import '../exceptions/command.exception.dart';
import '../utils/validators.util.dart';

class Command {
  late String _command;
  late List<String> _arguments;
  int _count = 0, _delay = 0, _repeat = 0, _timeout = 0;
  List<String> _errors = [], _responses = [];
  List<String> arguments = [
    'cmd',
    'delay',
    'repeat',
    'errors',
    'responses',
    'timeout',
  ];

  Command();

  String get command {
    return _command;
  }

  int get delay {
    return _delay;
  }

  int get repeat {
    return _repeat;
  }

  int get timeout {
    return _timeout;
  }

  List<String> get errors {
    return _errors;
  }

  List<String> get responses {
    return _responses;
  }

  _normalize() {
    if (_timeout > 0) {
      _repeat = 0;
    }

    if (_repeat == 0 && _timeout == 0) {
      _delay = 0;
    }
  }

  _set() {
    for (String _argument in _arguments) {
      String _arg = _argument.split(':')[0];
      String _param = _argument.split(':')[1];

      switch (_arg) {
        case 'cmd':
          _command = _param;
          break;
        case 'delay':
          _delay = int.parse(_param).abs();
          break;
        case 'repeat':
          _repeat = int.parse(_param).abs();
          break;
        case 'errors':
          _errors = _param.split(',');
          break;
        case 'responses':
          _responses = _param.split(',');
          break;
        case 'timeout':
          _timeout = int.parse(_param).abs();
          break;
      }
    }
  }

  formatSave(String line) {
    List<String> _argumentsInLine = line.split(' ');
    bool contain = true;

    if (_argumentsInLine.length > arguments.length) {
      throw ArgumentsException(
          'Existe mais argumentos que o necessário.\nVerifique se não existe espaços a mais no código.');
    }

    for (String _argument in arguments) {
      for (String _argumentInLine in _argumentsInLine) {
        if (!_argumentInLine.contains(_argument + ':')) {
          if (_count == arguments.length - 1) {
            throw ArgumentsException(
                'Notei que existe argumentos não reconhecidos.\nVerifique o nome dos argumentos e se não existe espaços a mais no código.');
          }
          _count++;
        } else {
          contain = true;
        }
      }
      if (contain) break;
    }

    validateLine(_argumentsInLine);
    _arguments = _argumentsInLine;
    _set();
    _normalize();
  }
}
