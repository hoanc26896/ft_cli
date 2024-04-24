import 'package:ft_cli/core/utils/bool_utils.dart';
import 'package:ft_cli/core/utils/reserved_words.dart';
import 'package:ft_cli/models/entities/design_pattern/design_pattern.dart';

class ControllerDesignPattern extends DesignPattern {
  static const String _template = r'''
import 'package:get/get.dart';

class {{controllerNameClass}} extends GetxController {
  final _loading = false.obs;
  get loading => _loading.value; // use getter

  setLoading(bool loading){
    _loading.value = loading;
  }
}
          ''';

  @override
  String nameFile() {
    return persistValue(
      'controllerNameFile',
      '{{name.snakeCase}}_controller',
    );
  }

  @override
  String path() {
    return persistValue(
      'controllerPath',
      'pages/controller/{{name.snakeCase}}',
    );
  }

  @override
  String nameClass() {
    return persistValue(
      'controllerNameClass',
      '{{name.pascalCase}}Controller',
    );
  }

  @override
  String template() {
    return readTemplete(
      'template',
      'controller.template',
      _template,
      ReservedWords.removeWordsInFile(
        fileString: path(),
      ),
    );
  }

  @override
  String nameDesignPattern() {
    return 'controller';
  }

  @override
  String extension() {
    return persistValue(
      'controllerExtension',
      'dart',
    );
  }

  @override
  bool generate() {
    return BoolUtils.parse(persistValue(
      'controllerGenerate',
      true,
    ));
  }
}
