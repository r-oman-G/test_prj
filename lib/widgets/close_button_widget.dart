import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constant/colors.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({
    this.onTapAction,
    Key? key,
  }) : super(key: key);

  //Default is Navigator.of(context).maybePop();
  final VoidCallback? onTapAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: InkWell(
        onTap: () {
          if (onTapAction == null) {
            Navigator.of(context).maybePop();
          } else {
            onTapAction?.call();
          }
        },
        child: const Icon(
          Icons.close,
          size: 24,
          color: ProjectColor.black,
        ),
      ),
    );
  }
}
