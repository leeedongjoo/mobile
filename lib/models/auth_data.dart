// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthData {
  final String email;
  final String tokenType;
  final String token;
  final DateTime expiresAt;

  AuthData({
    required this.email,
    required this.tokenType,
    required this.token,
    required this.expiresAt,
  });

  AuthData copyWith({
    String? email,
    String? tokenType,
    String? token,
    DateTime? expiresAt,
  }) {
    return AuthData(
      email: email ?? this.email,
      tokenType: tokenType ?? this.tokenType,
      token: token ?? this.token,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'token_type': tokenType,
      'access_token': token,
      'expires_at': expiresAt.millisecondsSinceEpoch,
    };
  }

  // NOTE: AuthData 로 매핑
  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      email: map['email'] ?? '', // 기본값으로 빈 문자열 설정
      tokenType: map['token_type'] ?? 'Bearer', // 기본값 설정
      token: map['access_token'] ?? '', // 기본값 설정
      expiresAt: map['expires_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['expires_at'])
          : DateTime.now(), // 기본값으로 현재 시간을 설정
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthData.fromJson(String source) =>
      AuthData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AuthData(tokenType: $tokenType, token: $token, expiresAt: $expiresAt)';
}
