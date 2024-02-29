import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xoxo_game/app/controller/player_model_provider.dart';
import 'package:xoxo_game/utils/widgets/custom_loading.dart';
import 'package:xoxo_game/utils/widgets/custom_text_field.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomLoadingAnimation(),
        const SizedBox(height: 20),
        const Text('Waiting for a player to join...'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomTextField(
            controller: roomIdController,
            hintText: '',
            isReadOnly: true,
          ),
        ),
      ],
    );
  }
}
