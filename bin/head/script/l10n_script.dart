import 'package:blogger_theme/blogger_theme.dart';
import '../../locales/l10n_generator.dart';

final l10nScript = Script(
  type: 'text/javascript',
  contentInCDATA: true,
  content: generateL10nScript(),
);
