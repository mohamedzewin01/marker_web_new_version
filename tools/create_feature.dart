import 'dart:convert';
import 'dart:developer';
import 'dart:io';

void main(List<String> arguments) {
  String? featureName;

  if (arguments.isNotEmpty) {
    featureName = arguments.first;
  } else {
    stdout.write('📛 Enter feature name: ');
    stdout.flush();
    featureName = stdin.readLineSync(encoding: utf8);
  }

  if (featureName == null || featureName.isEmpty) {
    print('❌ Feature name is required.');
    exit(1);
  }

  final basePath = 'lib/features/$featureName';
  final pascalName = _pascalCase(featureName);

  final folders = [
    '$basePath/data/models',
    '$basePath/data/models/request',
    '$basePath/data/models/response',
    '$basePath/data/datasources',
    '$basePath/data/repositories_impl',
    '$basePath/domain/entities',
    '$basePath/domain/repositories',
    '$basePath/domain/useCases',
    '$basePath/presentation/bloc',
    '$basePath/presentation/pages',
    '$basePath/presentation/widgets',
  ];

  for (final folder in folders) {
    final dir = Directory(folder);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📁 CREATED: $folder');
    }
  }

  // Repository interface
  createFile(
    '$basePath/domain/repositories/${featureName}_repository.dart',
    '''
abstract class ${pascalName}Repository {

}
''',
  );

  // Datasource interface
  createFile(
    '$basePath/data/datasources/${featureName}_datasource_repo.dart',
    '''
abstract class ${pascalName}DatasourceRepo {

}
''',
  );

  // Datasource implementation
  createFile(
    '$basePath/data/datasources/${featureName}_datasource_repo_impl.dart',
    '''
import '${featureName}_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: ${pascalName}DatasourceRepo)
class ${pascalName}DatasourceRepoImpl implements ${pascalName}DatasourceRepo {
  final ApiService apiService;
  ${pascalName}DatasourceRepoImpl(this.apiService);
}
''',
  );

  // UseCase interface
  createFile(
    '$basePath/domain/useCases/${featureName}_useCase_repo.dart',
    '''
abstract class ${pascalName}UseCaseRepo {
  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
''',
  );

  // UseCase implementation
  createFile(
    '$basePath/domain/useCases/${featureName}_useCase_repo_impl.dart',
    '''
import '../repositories/${featureName}_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/${featureName}_useCase_repo.dart';

@Injectable(as: ${pascalName}UseCaseRepo)
class ${pascalName}UseCase implements ${pascalName}UseCaseRepo {
  final ${pascalName}Repository repository;

  ${pascalName}UseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
''',
  );

  // Repository Implementation
  createFile(
    '$basePath/data/repositories_impl/${featureName}_repo_impl.dart',
    '''
import 'package:injectable/injectable.dart';
import '../../domain/repositories/${featureName}_repository.dart';

@Injectable(as: ${pascalName}Repository)
class ${pascalName}RepositoryImpl implements ${pascalName}Repository {
  // implementation
}
''',
  );

  // Page
  createFile(
    '$basePath/presentation/pages/${featureName}_page.dart',
    '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../bloc/${featureName}_cubit.dart';

class ${featureName}Page extends StatefulWidget {
  const ${featureName}Page({super.key});

  @override
  State<${featureName}Page> createState() => _${featureName}PageState();
}

class _${featureName}PageState extends State<${featureName}Page> {

  late ${featureName}Cubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<${featureName}Cubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text('$featureName')),
        body: const Center(child: Text('Hello $featureName')),
      ),
    );
  }
}

''',
  );

  // Cubit
  createFile(
    '$basePath/presentation/bloc/${featureName}_cubit.dart',
    '''
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import '../../domain/useCases/${pascalName}_useCase_repo.dart';

part '${featureName}_state.dart';

@injectable
class ${pascalName}Cubit extends Cubit<${pascalName}State> {
  ${pascalName}Cubit(this._${pascalName.toLowerCase()}UseCaseRepo) : super(${pascalName}Initial());
  final ${pascalName}UseCaseRepo _${pascalName.toLowerCase()}UseCaseRepo;
}
''',
  );

  // State
  createFile(
    '$basePath/presentation/bloc/${featureName}_state.dart',
    '''
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
''',
  );

  log('✅ All files have been created successfully.');
}

/// تحويل من snake_case إلى PascalCase
String _pascalCase(String input) {
  return input
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join();
}

void createFile(String path, String content) {
  final file = File(path);
  if (file.existsSync()) {
    log('⚠️ File already exists: ${path.split('/').last} — skipped.');
  } else {
    file.writeAsStringSync(content);
    log('✅ Created: ${path.split('/').last}');
  }
}
