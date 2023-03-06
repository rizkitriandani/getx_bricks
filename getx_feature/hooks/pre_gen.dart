import 'package:mason/mason.dart';

void run(HookContext context) async {
  context.logger.info('Running pre_gen.dart');
  final brick = Brick.git(GitPath(
      'https://github.com/rizkitriandani/getx_bricks.git',
      path: 'getx_feature'));
  final generator = await MasonGenerator.fromBrick(brick);
  
}
