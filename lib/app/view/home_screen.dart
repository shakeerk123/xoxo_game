import 'package:flutter/material.dart';
import 'package:xoxo_game/app/responsive/responsive.dart';
import 'package:xoxo_game/app/view/create_room.dart';
import 'package:xoxo_game/app/view/join_room.dart';
import 'package:xoxo_game/utils/widgets/bounce_button.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home-screen";
  const HomeScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoom.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoom.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BouncingButton(
              onTap: () => createRoom(context),
              text: 'Create Room',
            ),
            const SizedBox(
              height: 30,
            ),
            BouncingButton(
              onTap: () => joinRoom(context),
              text: 'Join Room',
            ),
          ],
        ),
      ),
    );
  }
}
