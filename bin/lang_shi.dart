import 'models/command.model.dart';

void main() {
  String line =
      "cmd:CP+123456789 delay:-123 errors:123 responses:1234 timeout:1 repeat:12";
  Command command = Command();

  try {
    command.formatSave(line);

    print(command.command);
    print(command.delay);
    print(command.repeat);
    print(command.timeout);
    print(command.errors);
    print(command.responses);
    print(command.arguments);
  } on ArgumentError catch (e) {
    print(e.message);
  }
}
