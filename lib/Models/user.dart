class user {
  final String? cardGuide;
  final String? agentName;
  final String? mobile;
  final String? firebaseToken;

  user({
    this.agentName,
    this.cardGuide,
    this.mobile,
    this.firebaseToken,
  });

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
        agentName: json['AgentName'],
        cardGuide: json['CardGuide'],
        mobile: json['Mobile'],
        firebaseToken: json['FirebaseToken']);
  }
}
