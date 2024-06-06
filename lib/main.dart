import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_1/presentation/pages/daymood/bloc/daymood_bloc.dart';
import 'package:test_1/presentation/pages/daymood/daymood.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/emotion_button_bloc/emotion_button_bloc.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/feeling_button_bloc/feeling_button_bloc.dart';
import 'package:test_1/presentation/pages/daymood/widgets/blocs/switch_button_bloc/switch_button_bloc.dart';

void main() {
  initializeDateFormatting('ru_RU', null)
      .then((_) => runApp(MultiBlocProvider(providers: [
            BlocProvider<SwitchButtonBloc>(
                create: (BuildContext context) => SwitchButtonBloc()),
            BlocProvider<EmotionButtonBloc>(
              create: (BuildContext context) => EmotionButtonBloc(),
            ),
            BlocProvider<FeelingButtonBloc>(
              create: (BuildContext context) => FeelingButtonBloc(),
            ),
            BlocProvider<DayMoodBloc>(
              create: (BuildContext context) => DayMoodBloc(),
            )
          ], child: MaterialApp(home: DayMoodScreen()))));
}
