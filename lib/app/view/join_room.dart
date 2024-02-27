import 'package:flutter/material.dart';
import 'package:xoxo_game/app/resources/socket_methods.dart';
import 'package:xoxo_game/app/responsive/responsive.dart';
import 'package:xoxo_game/utils/widgets/bounce_button.dart';
import 'package:xoxo_game/utils/widgets/custom_text.dart';
import 'package:xoxo_game/utils/widgets/custom_text_field.dart';

class JoinRoom extends StatefulWidget {
  static String routeName = "/join-room";

  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  shadows: [Shadow(blurRadius: 40, color: Colors.red)],
                  text: "Join Room",
                  fontSize: 70),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                controller: textController,
                hintText: 'Enter your name',
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomTextField(
                controller: gameIdController,
                hintText: 'Enter GameID',
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              BouncingButton(
                onTap: () {
                  _socketMethods.joinRoom(
                      textController.text, gameIdController.text);
                },
                text: 'Join Room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
