import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/area_of_circle/area_of_circle_bloc.dart';
import 'blocs/simple_interest/simple_interest_bloc.dart';
import 'blocs/student_list/student_list_bloc.dart';
import 'screens/dashboard_screen.dart';
import 'screens/area_of_circle_screen.dart';
import 'screens/simple_interest_screen.dart';
import 'screens/student_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AreaOfCircleBloc()),
        BlocProvider(create: (_) => SimpleInterestBloc()),
        BlocProvider(create: (_) => StudentListBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => DashboardScreen(),
          '/area': (_) => AreaOfCircleScreen(),
          '/interest': (_) => SimpleInterestScreen(),
          '/students': (_) => StudentListScreen(),
        },
      ),
    );
  }
}
