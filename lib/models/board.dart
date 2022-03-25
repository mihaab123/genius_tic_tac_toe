import 'dart:convert';

import 'package:flutter/foundation.dart';

class BoardModel {
  List<int> boardList = [];
  BoardModel({
    required this.boardList,
  });

  BoardModel copyWith({
    List<int>? boardList,
  }) {
    return BoardModel(
      boardList: boardList ?? this.boardList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'boardList': boardList,
    };
  }

  factory BoardModel.fromMap(Map<String, dynamic> map) {
    return BoardModel(
      boardList: List<int>.from(map['boardList']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardModel.fromJson(String source) =>
      BoardModel.fromMap(json.decode(source));

  @override
  String toString() => 'BoardModel(boardList: $boardList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoardModel && listEquals(other.boardList, boardList);
  }

  @override
  int get hashCode => boardList.hashCode;
}
