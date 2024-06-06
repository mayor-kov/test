import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/emotion_button_bloc/emotion_button_bloc.dart';

class EmotionButton extends StatelessWidget {
  final String pathToImage;
  final String titel;
  final bool isSelected;
  final int index;

  static const double width = 83.0;
  static const double borderRadius = 76.0;
  static const double paddingContent = 15.0;
  static const double offsetDx = 2.0;
  static const double offsetDy = 4.0;
  static const double blurRadius = 5.0;
  static const double spreadRadius = 0.0;
  static const double borderWidth = 2.0;
  static const double fontSize = 11.0;

  const EmotionButton(
      {super.key,
      required this.titel,
      required this.pathToImage,
      required this.isSelected,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: paddingContent),
      child: Container(
        width: width,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFFFF),
          shadows: isSelected == false
              ? const [
                  BoxShadow(
                      offset: Offset(offsetDx, offsetDy),
                      color: Color(0xFFD8D5DA),
                      blurRadius: blurRadius,
                      spreadRadius: spreadRadius)
                ]
              : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: borderWidth,
                color: isSelected
                    ? const Color(0xFFFF8702)
                    : const Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          onTap: () => context
              .read<EmotionButtonBloc>()
              .add(GetSelectedIndexEvent(selectedIndex: index)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(pathToImage),
              Text(
                titel,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF4C4C69),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
