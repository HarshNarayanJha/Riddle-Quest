import 'dart:convert';

class Player {
  final String nickname;
  final String socketId;
  final double points;
  final int imagesDone;

  Player(
      {required this.nickname,
      required this.socketId,
      required this.points,
      required this.imagesDone});

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'socketId': socketId,
      'points': points,
      'imagesDone': imagesDone,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      socketId: map['socketId'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      imagesDone: map['imagesDone']?.toInt() ?? 0,
    );
  }

  Player copyWith({
    String? nickname,
    String? socketId,
    double? points,
    int? imagesDone,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketId: socketId ?? this.socketId,
      points: points ?? this.points,
      imagesDone: imagesDone ?? this.imagesDone,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source));
}
