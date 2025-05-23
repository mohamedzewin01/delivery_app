// import 'dart:io';
//
// void main(List<String> arguments) {
//   if (arguments.isEmpty) {
//     print('❌ يرجى إدخال اسم الميزة.');
//     exit(1);
//   }
//
//   final featureName = arguments[0];
//   final basePath = 'lib/features/$featureName';
//
//   final folders = [
//     '$basePath/data/models',
//     '$basePath/data/models/request',
//     '$basePath/data/models/response',
//     '$basePath/data/datasources',
//     '$basePath/data/repositories_impl',
//     '$basePath/domain/entities',
//     '$basePath/domain/repositories',
//     '$basePath/domain/usecases',
//     '$basePath/presentation/bloc',
//     '$basePath/presentation/pages',
//     '$basePath/presentation/widgets',
//   ];
//
//   for (final folder in folders) {
//     final dir = Directory(folder);
//     if (!dir.existsSync()) {
//       dir.createSync(recursive: true);
//       print('📁 تم إنشاء: $folder');
//     }
//   }
//
//   final repoFile = File('$basePath/domain/repositories/${featureName}_repository.dart');
//   repoFile.writeAsStringSync('''
// abstract class ${_pascalCase(featureName)}Repository {
//
// }
// ''');
//   print('✅ تم إنشاء repository');
//
//   final dataSourceRepoFile = File('$basePath/data/datasources/${featureName}_datasource_repo.dart');
//   dataSourceRepoFile.writeAsStringSync('''
// abstract class ${_pascalCase(featureName)}DatasourceRepo {
//
// }
// ''');
//   print('✅ تم إنشاء dataSourceFile');
//
//   final dataSourceRepoImplFile = File('$basePath/data/datasources/${featureName}_datasource_repo_impl.dart');
//   dataSourceRepoImplFile.writeAsStringSync('''
// import '${featureName}_datasource_repo.dart';
// import 'package:injectable/injectable.dart';
// import 'package:delivery/core/api/api_manager/api_manager.dart' ;
//
// @Injectable(as: ${_pascalCase(featureName)}DatasourceRepo)
// class ${_pascalCase(featureName)}DatasourceRepoImpl implements ${_pascalCase(featureName)}DatasourceRepo {
//  final ApiService apiService;
//   ${_pascalCase(featureName)}DatasourceRepoImpl(this.apiService);
//
// }
// ''');
//   print('✅ تم إنشاء dataSourceRepoImplFile');
//
//   final usecaseRepoFile = File('$basePath/domain/usecases/${featureName}_usecase_repo.dart');
//   usecaseRepoFile.writeAsStringSync('''
//
// abstract class ${_pascalCase(featureName)}UseCaseRepo {
//
//
//   // Future<Result<T>> call(...) async {
//   //   return await repository.get...();
//   // }
// }
// ''');
//
//
//   final usecaseFile = File('$basePath/domain/usecases/${featureName}_usecase_repo_impl.dart');
//   usecaseFile.writeAsStringSync('''
// import '../repositories/${featureName}_repository.dart';
// import 'package:injectable/injectable.dart';
// import '../usecases/${featureName}_usecase_repo.dart';
//
//
// @Injectable(as: ${_pascalCase(featureName)}UseCaseRepo)
// class ${_pascalCase(featureName)}UseCase implements ${_pascalCase(featureName)}UseCaseRepo {
//   final ${_pascalCase(featureName)}Repository repository;
//
//   ${_pascalCase(featureName)}UseCase(this.repository);
//
//   // Future<Result<T>> call(...) async {
//   //   return await repository.get...();
//   // }
// }
// ''');
//   print('✅ تم إنشاء usecase');
//
//   final pageFile = File('$basePath/presentation/pages/${featureName}_page.dart');
//   pageFile.writeAsStringSync('''
// import 'package:flutter/material.dart';
//
// class ${_pascalCase(featureName)}Page extends StatelessWidget {
//   const ${_pascalCase(featureName)}Page({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('${_pascalCase(featureName)}')),
//       body: const Center(child: Text('Hello ${_pascalCase(featureName)}')),
//     );
//   }
// }
// ''');
//   print('✅ تم إنشاء page');
//
//
//   final repoImplFile = File('$basePath/data/repositories_impl/${featureName}_repo_impl.dart');
//   repoImplFile.writeAsStringSync('''
//
// import 'package:injectable/injectable.dart';
//
// import '../../domain/repositories/${featureName}_repository.dart';
// import '../../domain/usecases/${featureName}_usecase_repo.dart';
//
// @Injectable(as: ${_pascalCase(featureName)}UseCaseRepo)
// class ${_pascalCase(featureName)}UseCase implements ${_pascalCase(featureName)}UseCaseRepo {
//   final ${_pascalCase(featureName)}Repository repository;
//
//   ${_pascalCase(featureName)}UseCase(this.repository);
//
//   // Future<Result<T>> call(...) async {
//   //   return await repository.get...();
//   // }
// }
// ''');
// }
//
//
//
//
// String _pascalCase(String input) {
//   return input
//       .split('_')
//       .map((word) => word[0].toUpperCase() + word.substring(1))
//       .join();
// }

import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('❌ يرجى إدخال اسم الميزة.');
    exit(1);
  }

  final featureName = arguments[0];
  final basePath = 'lib/features/$featureName';

  final folders = [
    '$basePath/data/models',
    '$basePath/data/models/request',
    '$basePath/data/models/response',
    '$basePath/data/datasources',
    '$basePath/data/repositories_impl',
    '$basePath/domain/entities',
    '$basePath/domain/repositories',
    '$basePath/domain/usecases',
    '$basePath/presentation/bloc',
    '$basePath/presentation/pages',
    '$basePath/presentation/widgets',
  ];

  for (final folder in folders) {
    final dir = Directory(folder);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📁 تم إنشاء: $folder');
    }
  }

  final pascalName = _pascalCase(featureName);

  // Repository
  File('$basePath/domain/repositories/${featureName}_repository.dart')
    .writeAsStringSync('''
abstract class ${pascalName}Repository {

}
''');

  print('✅ تم إنشاء repository');

  // Datasource Repo
  File('$basePath/data/datasources/${featureName}_datasource_repo.dart')
    .writeAsStringSync('''
abstract class ${pascalName}DatasourceRepo {

}
''');

  print('✅ تم إنشاء dataSourceRepo');

  // Datasource Repo Impl
  File('$basePath/data/datasources/${featureName}_datasource_repo_impl.dart')
    .writeAsStringSync('''
import '${featureName}_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:delivery/core/api/api_manager/api_manager.dart';

@Injectable(as: ${pascalName}DatasourceRepo)
class ${pascalName}DatasourceRepoImpl implements ${pascalName}DatasourceRepo {
  final ApiService apiService;
  ${pascalName}DatasourceRepoImpl(this.apiService);

}
''');

  print('✅ تم إنشاء dataSourceRepoImpl');

  // Usecase Repo
  File('$basePath/domain/usecases/${featureName}_usecase_repo.dart')
    .writeAsStringSync('''
abstract class ${pascalName}UseCaseRepo {
  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
''');

  // Usecase Impl
  File('$basePath/domain/usecases/${featureName}_usecase_repo_impl.dart')
    .writeAsStringSync('''
import '../repositories/${featureName}_repository.dart';
import 'package:injectable/injectable.dart';
import '../usecases/${featureName}_usecase_repo.dart';

@Injectable(as: ${pascalName}UseCaseRepo)
class ${pascalName}UseCase implements ${pascalName}UseCaseRepo {
  final ${pascalName}Repository repository;

  ${pascalName}UseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
''');

  print('✅ تم إنشاء usecase');

  // Page
  File('$basePath/presentation/pages/${featureName}_page.dart')
    ..writeAsStringSync('''
import 'package:flutter/material.dart';

class ${pascalName}Page extends StatelessWidget {
  const ${pascalName}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$pascalName')),
      body: const Center(child: Text('Hello $pascalName')),
    );
  }
}
''');

  print('✅ تم إنشاء page');

  // Repository Impl (تم تكرار الكود بالغلط في النسخة الأصلية — نحذف أو نعدله)
  File('$basePath/data/repositories_impl/${featureName}_repo_impl.dart')
    ..writeAsStringSync('''
import 'package:injectable/injectable.dart';
import '../../domain/repositories/${featureName}_repository.dart';

@Injectable(as: ${pascalName}Repository)
class ${pascalName}RepositoryImpl implements ${pascalName}Repository {
  // implementation
}
''');

  print('✅ تم إنشاء repository_impl');

  // Cubit
  File('$basePath/presentation/bloc/${featureName}_cubit.dart')
    ..writeAsStringSync('''
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

part '${featureName}_state.dart';

@injectable
class ${pascalName}Cubit extends Cubit<${pascalName}State> {
  ${pascalName}Cubit() : super(${pascalName}Initial());
}
''');

  // State
  File('$basePath/presentation/bloc/${featureName}_state.dart')
    ..writeAsStringSync('''
part of '${featureName}_cubit.dart';

@immutable
sealed class ${pascalName}State {}

final class ${pascalName}Initial extends ${pascalName}State {}
final class ${pascalName}Loading extends ${pascalName}State {}
final class ${pascalName}Success extends ${pascalName}State {}
final class ${pascalName}Failure extends ${pascalName}State {
  final Exception exception;

  ${pascalName}Failure(this.exception);
}
''');

  print('✅ تم إنشاء Cubit و State');
}

/// يحول من snake_case إلى PascalCase
String _pascalCase(String input) {
  return input
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join();
}
