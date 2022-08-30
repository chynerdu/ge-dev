import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

bottomSheetPopUp(
    {@required Widget? child,
    BuildContext? ctx,
    Color? color,
    dynamic height,
    bool enableDrag = true,
    bool isDismissible = true}) {
  return showCupertinoModalBottomSheet(
      enableDrag: enableDrag,
      backgroundColor: Colors.white,
      context: ctx as BuildContext,
      expand: false,
      elevation: 0,
      isDismissible: isDismissible,
      topRadius: const Radius.circular(30),
      builder: (context) {
        return SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
                height: height ?? MediaQuery.of(context).size.height * 0.5,
                padding: MediaQuery.of(context).viewInsets,
                child: Align(alignment: Alignment.bottomCenter, child: child)));
      });
}
