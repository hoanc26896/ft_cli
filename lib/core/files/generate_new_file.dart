import 'dart:convert';
import 'dart:io';

import 'package:js_cli/core/utils/directory_utils.dart';
import 'package:js_cli/core/utils/reserved_words.dart';
import 'package:js_cli/models/dtos/new_file_dto.dart';

class GenerateNewFile {
  static List<NewFileDto> read(
    String group,
    String path,
    String prefixNameNewFile,
  ) {
    final file = '${prefixNameNewFile}_new_file_trigger.json';
    final fileTemplate = '${prefixNameNewFile}_new_file_exemple.template';
    var root = '.js_cli';

    path = ReservedWords.removeWordsInFile(
      fileString: '$group/$path',
    );
    var existFile = File('$root/$path/$file').existsSync();

    if (!existFile) {
      DirectoryUtils.create(root + '/' + path);
      File('$root/$path/$fileTemplate').writeAsStringSync('');
      File('$root/$path/$file').writeAsStringSync(
        json.encode(
          [
            NewFileDto('', '$root/$path/$fileTemplate', 'dart').toJson(),
          ],
        ),
      );
    }

    return (json.decode(File('$root/$path/$file').readAsStringSync()) as List)
        .map((e) => NewFileDto.fromJson(e))
        .toList();
  }
}