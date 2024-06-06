import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/common/utlis/constants/assets/image_assets.dart';
import 'package:test_1/common/utlis/constants/titels/titles.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/emotion_button_bloc/emotion_button_bloc.dart';
import 'package:test_1/presentation/pages/daymood/widgets/emotion_button.dart';

class ListEmotionsButton extends StatelessWidget {
  const ListEmotionsButton({super.key});

  static const double height = 148.0;
  static const double paddingw32 = 32.0;
  static const double paddingw15 = 15.0;
  static const Map<String, String> mapEmotionIcons = {
    Titles.joy: ImageAssets.joy,
    Titles.fear: ImageAssets.fear,
    Titles.rabies: ImageAssets.rabies,
    Titles.sadness: ImageAssets.sadness,
    Titles.clam: ImageAssets.calm,
    Titles.strength: ImageAssets.strength
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmotionButtonBloc, EmotionButtonState>(
      builder: (context, state) {
        switch (state) {
          case EmotionButtonInitial():
          case EmotionButtonSelectedIndex():
            return SizedBox(
              height: height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mapEmotionIcons.length,
                itemBuilder: (context, index) {
                  var listTiles = mapEmotionIcons.keys.toList();
                  var listEmotionIcons = mapEmotionIcons.values.toList();
                  return Padding(
                      padding: index != mapEmotionIcons.length - 1
                          ? index == 0
                              ? const EdgeInsets.only(
                                  left: paddingw32, right: paddingw15)
                              : const EdgeInsets.only(right: paddingw15)
                          : const EdgeInsets.only(right: paddingw32),
                      child: EmotionButton(
                        titel: listTiles[index],
                        pathToImage: listEmotionIcons[index],
                        isSelected: state is EmotionButtonInitial
                            ? false
                            : (state as EmotionButtonSelectedIndex)
                                        .selectedIndex ==
                                    index
                                ? true
                                : false,
                        index: index,
                      ));
                },
              ),
            );
        }
      },
    );
  }
}
