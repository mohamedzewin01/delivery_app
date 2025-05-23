import 'dart:io';

const pubspecContent = '''
name: YOUR_PROJECT_NAME
description: A new Flutter project.

publish_to: 'none' # Remove this line if you wish to publish to pub.dev

version: 1.0.0+1

environment:
  sdk: ">=2.18.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  flutter_localizations:
    sdk: flutter
  bloc: ^9.0.0
  bloc_test: ^10.0.0
  blur: ^4.0.0
  dio: ^5.7.0
  google_fonts: ^6.1.0
  get: ^4.6.5
  carousel_slider: ^5.0.0
  cached_network_image: ^3.3.1
  badges: ^3.1.2
  rxdart: ^0.28.0
  shared_preferences: ^2.2.2
  animated_theme_switcher: ^2.0.10
  flutter_rating_bar: ^4.0.1
  flutter_email_sender: ^7.0.0
  flutter_launcher_icons: ^0.14.3
  device_info_plus: ^11.3.0
  permission_handler: ^11.3.1
  lottie: ^3.0.0
  diacritic: ^0.1.5
  retrofit: ^4.4.1
  injectable: ^2.5.0
  intl: any
  json_annotation: ^4.9.0
  get_it: ^8.0.2
  pretty_dio_logger: ^1.4.0
  flutter_svg: ^2.0.14
  flutter_bloc: ^9.0.0
  device_preview: ^1.2.0
  skeletonizer: ^1.4.2
  firebase_core: ^3.12.1
  firebase_analytics: ^11.3.6
  firebase_crashlytics: ^4.2.0
  http:
  share_plus:
  auto_size_text: ^3.0.0
  open_filex:
  pdf:
  path_provider:
  flutter_html: ^3.0.0
  flutter_slidable: ^4.0.0

  another_flushbar: ^1.12.30
  webview_flutter: ^4.12.0
  url_launcher: ^6.3.1
  flutter_typeahead: ^5.2.0
  syncfusion_flutter_sliders: ^29.2.4
  geolocator: ^11.0.0
  geolocator_web:
  geocoding: ^2.1.0

flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/logo2.png"
  web:
    generate: true
    image_path: "assets/images/logo.png"
    background_color: "#hexcode"
    theme_color: "#hexcode"
  windows:
    generate: true
    image_path: "assets/images/logo.png"
    icon_size: 48
  macos:
    generate: true
    image_path: "assets/images/logo.png"

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.13
  injectable_generator: ^2.6.2
  json_serializable: ^6.8.0
  lints: ^5.0.0
  retrofit_generator: ^9.1.4

flutter:
  uses-material-design: true
  generate: true

  assets:
    - assets/
    - assets/images/
''';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart run create_project.dart <project_name>');
    return;
  }

  final projectName = args[0];

  print('🔨 Creating Flutter project: $projectName');

  // 1. إنشاء مشروع flutter جديد
  final createResult = await Process.run('flutter', ['create', projectName]);
  if (createResult.exitCode != 0) {
    print('❌ Error creating project:\n${createResult.stderr}');
    return;
  }
  print(createResult.stdout);

  // 2. تحديث pubspec.yaml بمحتوياتك الخاصة
  final pubspecPath = '$projectName/pubspec.yaml';
  final pubspecFile = File(pubspecPath);

  final newPubspecContent = pubspecContent.replaceAll('YOUR_PROJECT_NAME', projectName);

  await pubspecFile.writeAsString(newPubspecContent);
  print('✅ Updated pubspec.yaml with your dependencies');

  // 3. إنشاء مجلدات assets وصور عشان يتوافق مع pubspec.yaml
  final assetsDir = Directory('$projectName/assets/images');
  await assetsDir.create(recursive: true);
  print('✅ Created assets/images folder');

  // 4. إنشاء ملف مثال بسيط داخل lib/shared/widgets
  final widgetDir = Directory('$projectName/lib/shared/widgets');
  await widgetDir.create(recursive: true);
  final widgetFile = File('$projectName/lib/shared/widgets/sample_widget.dart');
  await widgetFile.writeAsString('''
import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  const SampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello from SampleWidget!'),
    );
  }
}
''');
  print('✅ Created sample_widget.dart');

  // 5. تشغيل flutter pub get
  print('⚙️ Running flutter pub get...');
  final pubGetResult = await Process.run('flutter', ['pub', 'get'], workingDirectory: projectName);
  if (pubGetResult.exitCode == 0) {
    print('🎉 Project $projectName is ready!');
  } else {
    print('❌ Failed to run flutter pub get: ${pubGetResult.stderr}');
  }
}
