import 'dart:math';

import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final double height = 18;
  final animationDuration = const Duration(milliseconds: 300);
  final String startText;
  final String finishText;
  final int countDivider = 6;
  final bool enabled;
  const SliderButton(
      {required this.startText,
      required this.finishText,
      this.enabled = true,
      super.key});

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class SliderButtonController extends ChangeNotifier {
  void reset() {
    notifyListeners();
  }
}

class _SliderButtonState extends State<SliderButton>
    with SingleTickerProviderStateMixin {
  double _sliderRelativePosition = 0.5;
  double _startedDraggingAtX = 0.0;
  late final AnimationController _animationController;
  late final Animation _sliderAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _sliderAnimation =
        CurveTween(curve: Curves.easeInQuad).animate(_animationController);

    _animationController.addListener(() {
      setState(() {
        _sliderRelativePosition = _sliderAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        const sliderRadius = 20 / 2;
        final sliderMaxX =
            MediaQuery.of(context).size.width - 94 - 2 * sliderRadius;
        final sliderPosX = sliderMaxX * _sliderRelativePosition;
        return Container(
          height: 77,
          decoration: ShapeDecoration(
              color: const Color(0xFFFFFFFF),
              shadows: const [
                BoxShadow(
                    offset: Offset(2, 4),
                    color: Color(0xFFD8D5DA),
                    blurRadius: 5,
                    spreadRadius: 0)
              ],
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(13),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 4),
                SizedBox(
                  height: 8,
                  width: MediaQuery.of(context).size.width - 94,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.countDivider,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index != widget.countDivider - 1
                              ? EdgeInsets.only(
                                  right: (MediaQuery.of(context).size.width -
                                          106) /
                                      5)
                              : EdgeInsets.zero,
                          child: Container(
                            height: 8,
                            width: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              color: const Color(0xFFE1DDD8),
                            ),
                          ),
                        );
                      }),
                ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  clipBehavior: Clip.none,
                  children: [
                    _buildBackground(
                        width: MediaQuery.of(context).size.width - 94,
                        backgroundSplitX: sliderPosX + sliderRadius),
                    _buildSlider(
                        sliderMaxX: sliderMaxX, sliderPositionX: sliderPosX),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.startText,
                      style: const TextStyle(
                        color: Color(0xFFE1DDD8),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.finishText,
                      style: const TextStyle(
                        color: Color(0xFFE1DDD8),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackground(
      {required double width, required double backgroundSplitX}) {
    return Row(
      children: [
        Container(
          height: 6,
          width: backgroundSplitX,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(topLeft: _radius, bottomLeft: _radius),
            color: widget.enabled
                ? const Color(0xFFFF8702)
                : const Color(0xFFE1DDD8),
          ),
        ),
        Container(
          height: 6,
          width: width - backgroundSplitX,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(topRight: _radius, bottomRight: _radius),
              color: const Color(0xFFE1DDD8)),
        ),
      ],
    );
  }

  Widget _buildSlider(
      {required double sliderMaxX, required double sliderPositionX}) {
    return Positioned(
      left: sliderPositionX,
      child: GestureDetector(
        onHorizontalDragStart: (start) {
          if (!widget.enabled) {
            return;
          }
          _startedDraggingAtX = sliderPositionX;
          _animationController.stop();
        },
        onHorizontalDragUpdate: (update) {
          if (!widget.enabled) {
            return;
          }
          final newSliderPositionX =
              _startedDraggingAtX + update.localPosition.dx;
          final newSliderRelativePosition = newSliderPositionX / sliderMaxX;
          setState(() {
            _sliderRelativePosition = max(0, min(1, newSliderRelativePosition));
          });
        },
        onHorizontalDragEnd: (end) {
          if (!widget.enabled) {
            return;
          }
        },
        child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(_radius),
              color: widget.enabled
                  ? const Color(0xFFFF8702)
                  : const Color(0xFFE1DDD8),
              border: Border.all(color: const Color(0xFFFFFFFF), width: 4)),
        ),
      ),
    );
  }

  Radius get _radius => Radius.circular(widget.height);
}
