// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_1/common/utlis/constants/assets/svg_assets.dart';
import 'package:test_1/common/utlis/constants/titels/titles.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/switch_button_bloc/switch_button_bloc.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  static const double fullWidth = 288.0;
  static const double leftWidth = 172.0;
  static const double height = 30.0;
  static const double borderRadius = 15.0;

  static const double fontSize = 12.0;
  static const double paddingTitles = 10.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchButtonBloc, SwitchButtonState>(
      builder: (context, state) {
        switch (state) {
          case SwitchButtonInitial():
          case SwitchButtonSelectedFirst():
          case SwitchButtonSelectedSecond():
            return Stack(children: [
              Center(
                child: Container(
                  width: fullWidth,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: const Color(0xFFF2F2F2),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: leftWidth,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: state is! SwitchButtonSelectedSecond
                        ? const Color(0xFFFF8702)
                        : Colors.transparent,
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingTitles),
                    child: InkWell(
                      focusColor: Colors.transparent,
                      onTap: () => context.read<SwitchButtonBloc>().add(
                          const GetSelectedFirstIndexEvent(selectedIndex: 0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.dayBook,
                            color: state is! SwitchButtonSelectedSecond
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFFBCBCBF),
                          ),
                          Text(
                            Titles.dayBook,
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w500,
                                color: state is! SwitchButtonSelectedSecond
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFFBCBCBF)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: fullWidth - leftWidth,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: state is SwitchButtonSelectedSecond
                        ? const Color(0xFFFF8702)
                        : Colors.transparent,
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingTitles),
                    child: InkWell(
                      onTap: () => context.read<SwitchButtonBloc>().add(
                          const GetSelectedSecondIndexEvent(selectedIndex: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.barChart,
                            color: state is SwitchButtonSelectedSecond
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFFBCBCBF),
                          ),
                          Text(
                            Titles.statistics,
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w500,
                                color: state is SwitchButtonSelectedSecond
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFFBCBCBF)),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ])
            ]);
        }
      },
    );
  }
}
