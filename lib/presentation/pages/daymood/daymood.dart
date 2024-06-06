import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_1/common/utlis/constants/titels/titles.dart';
import 'package:test_1/presentation/pages/daymood/bloc/daymood_bloc.dart';
import 'package:test_1/presentation/pages/daymood/widgets/alert_dialog.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/emotion_button_bloc/emotion_button_bloc.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/feeling_button_bloc/feeling_button_bloc.dart';
import 'package:test_1/presentation/pages/daymood/widgets/list_emotions_button.dart';
import 'package:test_1/presentation/pages/daymood/widgets/list_feeling_button.dart';
import 'package:test_1/presentation/pages/daymood/widgets/slider_button.dart';
import 'package:test_1/presentation/pages/daymood/widgets/switch_button.dart';

// ignore: must_be_immutable
class DayMoodScreen extends StatelessWidget {
  DayMoodScreen({super.key});

  final String currentTime =
      DateFormat("d\tMMMM\thh:mm", "ru").format(DateTime.now());
  static const double paddingw32 = 32.0;
  static const double paddingw15 = 15.0;
  static const double paddingw10 = 10.0;
  static const double paddingw20 = 20.0;
  static const double paddingw18 = 18.0;
  static const double paddingw30 = 30.0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EmotionButtonBloc, EmotionButtonState>(
          listener: (context, state) {
            if (state is EmotionButtonSelectedIndex) {
              context.read<DayMoodBloc>().add(SelectedDayMoodEmotion(
                  sliderButtonEnable: true,
                  saveButtonEnable:
                      context.read<DayMoodBloc>().state is DayMoodInitial
                          ? false
                          : (context.read<DayMoodBloc>().state
                                  as DayMoodSelectedEmotion)
                              .saveButtonEnable));
            }
          },
        ),
        BlocListener<FeelingButtonBloc, FeelingButtonState>(
          listener: (context, state) {
            if (state is FeelingButtonSelectedIndex) {
              context.read<DayMoodBloc>().add(const SelectedDayMoodEmotion(
                  sliderButtonEnable: true, saveButtonEnable: true));
            }
          },
        ),
      ],
      child: BlocBuilder<DayMoodBloc, DayMoodState>(builder: (context, state) {
        switch (state) {
          case DayMoodInitial():
          case DayMoodSelectedEmotion():
            return Scaffold(
                backgroundColor: const Color(0xFFFFFDFC),
                appBar: AppBar(
                  forceMaterialTransparency: true,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: paddingw18),
                      child: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.calendar_month_rounded,
                            color: Color(0xFFBCBCBF)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                  centerTitle: true,
                  title: Text(
                    currentTime,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFBCBCBF)),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SwitchButton(),
                      const SizedBox(height: paddingw15),
                      const Padding(
                        padding: EdgeInsets.only(left: paddingw32),
                        child: Text(
                          Titles.title1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4C4C69),
                          ),
                        ),
                      ),
                      const ListEmotionsButton(),
                      Visibility(
                        visible: state is DayMoodSelectedEmotion ? true : false,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingw32),
                          child: ListFeelingButton(),
                        ),
                      ),
                      const SizedBox(height: paddingw10),
                      const Padding(
                        padding: EdgeInsets.only(left: paddingw32),
                        child: Text(
                          Titles.title2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4C4C69),
                          ),
                        ),
                      ),
                      const SizedBox(height: paddingw15),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: paddingw32),
                        child: SliderButton(
                            enabled:
                                state is DayMoodSelectedEmotion ? true : false,
                            startText: Titles.title6,
                            finishText: Titles.title7),
                      ),
                      const SizedBox(height: paddingw30),
                      const Padding(
                        padding: EdgeInsets.only(left: paddingw32),
                        child: Text(
                          Titles.title3,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4C4C69),
                          ),
                        ),
                      ),
                      const SizedBox(height: paddingw15),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: paddingw32),
                        child: SliderButton(
                            enabled:
                                state is DayMoodSelectedEmotion ? true : false,
                            startText: Titles.title8,
                            finishText: Titles.title9),
                      ),
                      const SizedBox(height: paddingw30),
                      const Padding(
                        padding: EdgeInsets.only(left: 32),
                        child: Text(
                          Titles.title4,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4C4C69),
                          ),
                        ),
                      ),
                      const SizedBox(height: paddingw20),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: paddingw32),
                        child: Container(
                          height: 90,
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
                                  borderRadius: BorderRadius.circular(20.0))),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                right: paddingw15, left: paddingw15),
                            child: TextField(
                                maxLines: 15,
                                style: TextStyle(
                                  color: Color(0xFF4C4C69),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      color: Color(0xFFE1DDD8),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hintText: Titles.title10,
                                    border: InputBorder.none)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: paddingw32, horizontal: paddingw32),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width -
                                paddingw32 * 2,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: state is DayMoodSelectedEmotion
                                  ? state.saveButtonEnable
                                      ? () async => showMyDialog(context)
                                      : null
                                  : null,
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  )),
                                  backgroundColor: MaterialStateProperty.all(
                                      state is DayMoodSelectedEmotion
                                          ? state.saveButtonEnable
                                              ? const Color(0xFFFF8702)
                                              : const Color(0xFFF2F2F2)
                                          : const Color(0xFFF2F2F2))),
                              child: Text(
                                Titles.title11,
                                style: TextStyle(
                                  color: state is DayMoodSelectedEmotion
                                      ? state.saveButtonEnable
                                          ? const Color(0xFFFFFFFF)
                                          : const Color(0xFFBCBCBF)
                                      : const Color(0xFFBCBCBF),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ));
        }
      }),
    );
  }
}
