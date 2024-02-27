import 'package:flutter/material.dart';
import 'package:xoxo_game/app/model/player_model.dart';

class RoomDataProvider extends ChangeNotifier {
List<String> _displayElement = ['', '', '', '', '', '', '', '', ''];
 Map<String, dynamic> _roomData = {};
 int _filledBoxes = 0;

 Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );

  Player _player2 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;
  List<String> get displayElements => _displayElement;
  int get filledBoxes => _filledBoxes;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElement[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }
 void setFilledBoxesTo0() {
    _filledBoxes = 0;
  }


}