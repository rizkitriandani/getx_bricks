import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  context.logger.info('Running pre_gen.dart');
  final featuresDirectory = Directory('/lib/features');
  final name = context.vars['name'] as String;

  final brick = Brick.version(name: "getx_feature", version: '0.1.0+1');
  final generator = await MasonGenerator.fromBrick(brick);
  // final blocDirectoryName = blocType.toDirectoryName();
  final directory = Directory(
    path.join(Directory.current.path, name.snakeCase, 'features'),
  );
  final target = DirectoryGeneratorTarget(directory);
  var vars = <String, dynamic>{'name': name};
  await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
  final files = await generator.generate(
    target,
    vars: vars,
    logger: context.logger,
    fileConflictResolution: FileConflictResolution.overwrite,
  );

  // if (featuresDirectory.existsSync()) {
  //   // The "features" directory exists, so create a subdirectory inside it.
  //   context.logger.info("EXIST");
  //   // final newDirectory = Directory('${featuresDirectory.path}/${context.vars['name'].snakeCase()}}');
  //   // newDirectory.createSync();
  // } else {
  //   // The "features" directory does not exist, so create it and a subdirectory inside it.
  //   // featuresDirectory.createSync();
  //   // final newDirectory = Directory(
  //   //     '${featuresDirectory.path}/${context.vars['name'].snakeCase()}}');
  //   // newDirectory.createSync();
  //   context.logger.info("NOT EXIST");
  // }
}
