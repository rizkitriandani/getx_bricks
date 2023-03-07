import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  context.logger.info('Running pre_gen.dart');
  final name = context.vars['name'] as String;

  context.logger.info('name: $name');

  final featuresDirectory = Directory(path.join(
    Directory.current.path,
    'lib',
    'features',
  ));
  context.logger.info('featuresDirectory: $featuresDirectory');

  if (featuresDirectory.existsSync()) {
    context.logger.info('folder features already exist');
    try {
      final brick = Brick.git(GitPath(
        'https://github.com/rizkitriandani/getx_bricks.git',
      ));
      final generator = await MasonGenerator.fromBrick(brick);
      final target = DirectoryGeneratorTarget(featuresDirectory);
      var vars = <String, dynamic>{'name': name};
      await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
      final files = await generator.generate(target,
          vars: vars,
          logger: context.logger,
          fileConflictResolution: FileConflictResolution.prompt);

      context.logger.info('files: $files');
    } catch (err) {
      context.logger.err('error: $err');
    }
  } else {
    context.logger.info('folder features not exist');
    Directory newDirectory = await featuresDirectory.create();
    final brick = Brick.git(GitPath(
        'https://github.com/rizkitriandani/getx_bricks.git',
        path: 'getx_feature'));
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(newDirectory);
    var vars = <String, dynamic>{'name': name};
    await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
    final files = await generator.generate(target,
        vars: vars,
        logger: context.logger,
        fileConflictResolution: FileConflictResolution.prompt);
    context.logger.info('files: $files');
  }
}
