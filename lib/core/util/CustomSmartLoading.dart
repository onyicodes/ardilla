import 'package:ardilla/core/general_widgets/custom_loading_loading_indicator.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

customSmartLoading({String message = 'loading...', required bool loading}) {
  loading
      ? SmartDialog.showLoading(
          builder: (_) {
            return CustomLoadingIndicator(loadingMessage: message);
          },
        )
      : SmartDialog.dismiss();
}
