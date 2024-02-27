import 'package:flutter/material.dart';
import 'package:xoxo_game/app/resources/socket_methods.dart';
import 'package:xoxo_game/app/responsive/responsive.dart';
import 'package:xoxo_game/utils/widgets/bounce_button.dart';
import 'package:xoxo_game/utils/widgets/custom_text.dart';
import 'package:xoxo_game/utils/widgets/custom_text_field.dart';

class CreateRoom extends StatefulWidget {
  static String routeName = "/create-room";
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
   _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
                  text: "Create Room",
                  fontSize: 70),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your name',
              ),
               SizedBox(
                height: size.height * 0.06,
              ),
      
              BouncingButton(
                onTap: () {
                  _socketMethods.createRoom(_nameController.text);
                },
                text: 'Create Room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
