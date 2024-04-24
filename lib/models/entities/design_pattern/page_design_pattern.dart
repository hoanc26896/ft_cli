import 'package:ft_cli/core/utils/bool_utils.dart';
import 'package:ft_cli/core/utils/reserved_words.dart';
import 'package:ft_cli/models/entities/design_pattern/design_pattern.dart';

class PageDesignPattern extends DesignPattern {
  static const String _template = '''
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:office/{{controllerPath}}/{{controllerNameFile}}.{{controllerExtension}}';

class {{pageNameClass}} extends GetView<{{controllerNameClass}}> {
  const {{pageNameClass}}({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
  ''';

  @override
  String nameFile() {
    return persistValue(
      'pageNameFile',
      '{{name.snakeCase}}_view',
    );
  }

  @override
  String path() {
    return persistValue(
      'pagePath',
      'pages/ui/{{name.snakeCase}}',
    );
  }

  @override
  String nameClass() {
    return persistValue(
      'pageNameClass',
      '{{name.pascalCase}}View',
    );
  }

  @override
  String template() {
    return readTemplete(
      'template',
      'page.template',
      _template,
      ReservedWords.removeWordsInFile(
        fileString: path(),
      ),
    );
  }

  @override
  String nameDesignPattern() {
    return 'page';
  }

  @override
  String extension() {
    return persistValue(
      'pageExtension',
      'dart',
    );
  }

  @override
  bool generate() {
    return BoolUtils.parse(persistValue(
      'pageGenerate',
      true,
    ));
  }
}
