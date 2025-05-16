import 'dart:io';

void main() {
  final featureName = 'address';
  final className = capitalize(featureName);

  final Map<String, Map<String, String>> structure = {
    'lib/core/error': {
      'exceptions.dart': '''
class ServerException implements Exception {}

class CacheException implements Exception {}
'''
    },
    'lib/core/utils': {
      'constants.dart': '''
class Constants {
  static const baseUrl = "https://api.example.com";
}
'''
    },
    'lib/core/usecases': {
      'usecase.dart': '''
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
'''
    },
    'lib/features/$featureName/data/datasources': {
      '${featureName}_remote_data_source.dart': '''
abstract class ${className}RemoteDataSource {
  Future<void> login(String email, String password);
}
''',
      '${featureName}_remote_data_source_impl.dart': '''
import '${featureName}_remote_data_source.dart';

class ${className}RemoteDataSourceImpl implements ${className}RemoteDataSource {
  @override
  Future<void> login(String email, String password) async {
    // TODO: implement login logic
  }
}
'''
    },
    'lib/features/$featureName/data/models': {
      '${featureName}_model.dart': '''
class ${className}Model {
  final String email;
  final String token;

  ${className}Model({required this.email, required this.token});

  factory ${className}Model.fromJson(Map<String, dynamic> json) {
    return ${className}Model(
      email: json['email'],
      token: json['token'],
    );
  }
}
'''
    },
    'lib/features/$featureName/data/repositories': {
      '${featureName}_repository_impl.dart': '''
import '../../domain/repositories/${featureName}_repository.dart';
import '../datasources/${featureName}_remote_data_source.dart';

class ${className}RepositoryImpl implements ${className}Repository {
  final ${className}RemoteDataSource remoteDataSource;

  ${className}RepositoryImpl(this.remoteDataSource);

  @override
  Future<void> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
'''
    },
    'lib/features/$featureName/domain/entities': {
      '${featureName}_entity.dart': '''
class ${className}Entity {
  final String email;
  final String token;

  ${className}Entity({required this.email, required this.token});
}
'''
    },
    'lib/features/$featureName/domain/repositories': {
      '${featureName}_repository.dart': '''
abstract class ${className}Repository {
  Future<void> login(String email, String password);
}
'''
    },
    'lib/features/$featureName/domain/usecases': {
      'login_usecase.dart': '''
import '../repositories/${featureName}_repository.dart';

class LoginUseCase {
  final ${className}Repository repository;

  LoginUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.login(email, password);
  }
}
'''
    },
    'lib/features/$featureName/presentation/blocs': {
      '${featureName}_bloc.dart': '''
// TODO: Add bloc implementation here
'''
    },
    'lib/features/$featureName/presentation/pages': {
      'login_page.dart': '''
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: const Center(child: Text("Login Page")),
    );
  }
}
'''
    },
    'lib': {
      'injection_container.dart': '''
// TODO: Setup dependency injection here
'''
    },
    '.': {
      'main.dart': '''
import 'package:flutter/material.dart';
import 'lib/features/$featureName/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
    );
  }
}
'''
    },
  };

  // إنشاء المجلدات والملفات وكتابة المحتوى
  structure.forEach((folder, files) {
    final dir = Directory(folder);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📁 Created folder: $folder');
    }

    files.forEach((fileName, content) {
      final file = File('${dir.path}/$fileName');
      if (!file.existsSync()) {
        file.writeAsStringSync(content);
        print('✅ Created file: ${file.path}');
      }
    });
  });

  print('\n🎯 Project architecture generated for feature: "$featureName"\n');
}

String capitalize(String text) => text[0].toUpperCase() + text.substring(1);
