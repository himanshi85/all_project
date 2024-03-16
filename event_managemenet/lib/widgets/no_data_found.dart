import 'package:event_managemenet/utils/context_ext.dart';
import 'package:event_managemenet/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class NoDataFound extends StatelessWidget {
  final String? image;
  final String? title;
  final String? msg;
  final double fontSize;
  final Color? color;
  final Color? titleColor;
  final Color? msgColor;

  final VoidCallback? onRetry;

  const NoDataFound({
    Key? key,
    this.image,
    this.title,
    this.msg,
    this.fontSize = 18.0,
    this.onRetry,
    this.color,
    this.titleColor,
    this.msgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (msg != null && msg!.isNotEmpty)
            Texts(
              msg!,
              fontSize: 18,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              style: context.bodySmall?.copyWith(color: msgColor),
            ),
        ],
      ),
    );
  }
}
