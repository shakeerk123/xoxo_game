import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xoxo_game/app/controller/player_model_provider.dart';
import 'package:xoxo_game/app/view/create_room.dart';
import 'package:xoxo_game/app/view/game_screen.dart';
import 'package:xoxo_game/app/view/home_screen.dart';
import 'package:xoxo_game/app/view/join_room.dart';
import 'package:xoxo_game/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:  (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true)
            .copyWith(scaffoldBackgroundColor: bgColor),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          JoinRoom.routeName: (context) => const JoinRoom(),
          CreateRoom.routeName: (context) => const CreateRoom(),
          GameScreen.routeName:(context)=> const GameScreen()
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
