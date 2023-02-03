import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isBusy;
  final double width;
  final double? fontsize;
  final Color? backgroundColor;

  const ProgressButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.width,
      this.isBusy = false,
      this.fontsize = 0,
      this.backgroundColor /*  =Theme.of(context).primaryColor */})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 44),
          elevation: 0,
          backgroundColor: backgroundColor),
      onPressed: isBusy ? null : onPressed,
      child: isBusy
          ? SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                backgroundColor: Colors.white30,
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          : Text(
              text,
              // style: fontsize == 0
              //     ? Theme.of(context).textTheme.displayMedium
              //     : Theme.of(context)
              //         .textTheme
              //         .displayMedium!
              //         .copyWith(fontSize: fontsize),
            ),
    );
  }
}