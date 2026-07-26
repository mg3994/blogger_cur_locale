import 'package:blogger_theme/blogger_theme.dart';
import '../../i18n/i18n_generator.dart';

final i18nScript = Script(
  type: 'text/javascript',
  contentInCDATA: true,
  content: generateI18nScript(),
);
