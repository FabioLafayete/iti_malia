import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoadingOverlay {
  ProgressDialog dialog;

  LoadingOverlay(BuildContext context) {
    Widget customBody = Center(
      child: Container(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(DesignColors.orange()),
          strokeWidth: 2,
        ),
        width: 24,
        height: 24,
      ),
    );

    this.dialog = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: false,
      customBody: customBody,
    );

    dialog.style(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetAnimCurve: Curves.easeInOut,
    );
  }

  Future<void> show() async {
    await this.dialog.show();
  }

  Future<void> hide() async {
    await this.dialog.hide();
  }
}
