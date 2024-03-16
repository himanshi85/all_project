import 'package:event_managemenet/app/globals.dart';
import 'package:event_managemenet/app/palette.dart';
import 'package:event_managemenet/utils/context_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'text_widget.dart';

class SwitchAdaptive extends StatefulWidget {
  final String? title;
  final bool value;
  final bool isEditable;
  final TextStyle? textStyle;
  final Function(bool) onChanged;
  final bool isAdaptive;

  const SwitchAdaptive({
    Key? key,
    this.title,
    required this.value,
    this.textStyle,
    this.isEditable = true,
    required this.onChanged,
    this.isAdaptive = true,
  }) : super(key: key);

  @override
  SwitchAdaptiveState createState() => SwitchAdaptiveState();
}

class SwitchAdaptiveState extends State<SwitchAdaptive> {
  bool value = false;

  @override
  void initState() {
    super.initState();

    value = widget.value;
  }

  @override
  void didUpdateWidget(covariant SwitchAdaptive oldWidget) {
    super.didUpdateWidget(oldWidget);
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEditable,
      child: Row(
        mainAxisSize: widget.title != null ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (widget.title != null)
            Expanded(
              child: Texts(
                widget.title!,
                style: widget.textStyle ?? context.titleMedium,
              ),
            ),
          if (widget.isAdaptive)
            Switch.adaptive(
              value: value,
              activeColor: isAndroid ? context.primaryColor : null,
              thumbColor: const MaterialStatePropertyAll(Palette.red),
              trackOutlineWidth: const MaterialStatePropertyAll(0),
              inactiveTrackColor: MaterialStateColor.resolveWith((states) => Palette.mediumGrey),
              activeTrackColor: MaterialStateColor.resolveWith(
                (states) => Palette.red.withOpacity(0.4),
              ),
              onChanged: (value) {
                if (!widget.isEditable) {
                  return;
                }
                this.value = value;
                widget.onChanged.call(value);
                setState(() {});
              },
            )
          else
            CupertinoSwitch(
              value: value,
              onChanged: (value) {
                if (!widget.isEditable) {
                  return;
                }
                this.value = value;
                widget.onChanged.call(value);
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}
