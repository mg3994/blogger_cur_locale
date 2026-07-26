// <div class='user-meta-strings'>
//                         <span class='user-display-name'>Guest User</span>
//                         <span class='user-display-role'>Workspace Client</span>
//                     </div>

import 'package:blogger_theme/blogger_theme.dart';
import '../../../../../i18n/app_internationalization.dart';

final user_meta_strings = Div(attributes: {
  'class': 'user-meta-strings',
}, children: [
  Span(
      attributes: {
        'class': 'user-display-name',
      },
      children: [AppI18n.current.guest_userComponent]),
  Span(
      attributes: {
        'class': 'user-display-role',
      },
      children: [AppI18n.current.workspace_clientComponent]),
]);
