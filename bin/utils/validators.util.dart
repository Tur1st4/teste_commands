import '../exceptions/command.exception.dart';

void validateLine(List<String> _argumentsInLine) {
  for (String _argumentInLine in _argumentsInLine) {
    List<String> _entrie = _argumentInLine.split(':');

    if (_entrie.length != 2) {
      throw ArgumentsException(
          'Existe um argumento dentro de outro ou sem parâmetro.\nVerifique se não existe argumentos sem espaço entre eles ou mais de 1 "dois pontos" no argumento, você também pode ter esquecido de passar o parâmetro.');
    }

    if (_entrie[1].isEmpty) {
      throw ArgumentsException(
          'Não existe parâmetro no argumento.\nVeja se você passou escreveu corretamente: [argumento]:[parametro]');
    }
  }
}
