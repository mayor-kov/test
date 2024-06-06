import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/common/utlis/constants/titels/titles.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/feeling_button_bloc/feeling_button_bloc.dart';

class ListFeelingButton extends StatelessWidget {
  const ListFeelingButton({super.key});

  static const double spacing = 8.0;
  static const double offsetDx = 2.0;
  static const double offsetDy = 4.0;
  static const double blurRadius = 5.0;
  static const double spreadRadius = 0.0;
  static const double padding = 5.0;

  static const List<String> buttonLabels = [
    Titles.excitation,
    Titles.delight,
    Titles.playfulness,
    Titles.pleasure,
    Titles.charm,
    Titles.mindfulness,
    Titles.courage,
    Titles.enjoyment,
    Titles.sensuality,
    Titles.energy,
    Titles.extravagance
  ];

  static const List<BoxShadow> boxShawow = [
    BoxShadow(
        offset: Offset(offsetDx, offsetDy),
        color: Color(0xFFD8D5DA),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius)
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeelingButtonBloc, FeelingButtonState>(
        builder: (context, state) {
      switch (state) {
        case FeelingButtonInitial():
        case FeelingButtonSelectedIndex():
          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: buttonLabels.asMap().entries.map((entry) {
              int index = entry.key;
              String label = entry.value;
              return Container(
                decoration: ShapeDecoration(
                  color: state is FeelingButtonInitial
                      ? const Color(0xFFFFFFFF)
                      : (state as FeelingButtonSelectedIndex).selectedIndex ==
                              index
                          ? const Color(0xFFFF8702)
                          : const Color(0xFFFFFFFF),
                  shadows: state is FeelingButtonInitial
                      ? boxShawow
                      : (state as FeelingButtonSelectedIndex).selectedIndex ==
                              index
                          ? null
                          : boxShawow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () => context
                      .read<FeelingButtonBloc>()
                      .add(GetSelectedIndexEvent(selectedIndex: index)),
                  child: Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: state is FeelingButtonInitial
                            ? const Color(0xFF4C4C69)
                            : (state as FeelingButtonSelectedIndex)
                                        .selectedIndex ==
                                    index
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF4C4C69),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
      }
    });
  }
}
