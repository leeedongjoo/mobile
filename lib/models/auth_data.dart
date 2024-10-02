// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthData {
  final String tokenType;
  final String token;
  final DateTime expiresAt;
  AuthData({
    required this.tokenType,
    required this.token,
    required this.expiresAt,
  });

  AuthData copyWith({
    String? tokenType,
    String? token,
    DateTime? expiresAt,
  }) {
    return AuthData(
      tokenType: tokenType ?? this.tokenType,
      token: token ?? this.token,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tokenType': tokenType,
      'token': token,
      'expiresAt': expiresAt.millisecondsSinceEpoch,
    };
  }

  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      tokenType: map['tokenType'] as String,
      token: map['token'] as String,
      expiresAt: DateTime.fromMillisecondsSinceEpoch(map['expiresAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthData.fromJson(String source) =>
      AuthData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AuthData(tokenType: $tokenType, token: $token, expiresAt: $expiresAt)';

  @override
  bool operator ==(covariant AuthData other) {
    if (identical(this, other)) return true;

    return other.tokenType == tokenType &&
        other.token == token &&
        other.expiresAt == expiresAt;
  }

  @override
  int get hashCode => tokenType.hashCode ^ token.hashCode ^ expiresAt.hashCode;
}
