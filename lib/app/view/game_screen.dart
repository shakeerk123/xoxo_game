import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xoxo_game/app/controller/player_model_provider.dart';
import 'package:xoxo_game/app/resources/socket_methods.dart';
import 'package:xoxo_game/utils/widgets/score_board.dart';
import 'package:xoxo_game/utils/widgets/tic_board.dart';
import 'package:xoxo_game/utils/widgets/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
   
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Scoreboard(),
                 const   TicTacToeBoard(),
                    Text(
                        '${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
                  ],
                ),
              ),
            ),
    );
  }
}