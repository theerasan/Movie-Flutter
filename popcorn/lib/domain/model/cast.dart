class Cast {
  Cast({
    required this.fullName,
    required this.character,
    this.avatarUrl,
    required this.id,
  });

  final num id;
  final String fullName;
  final String character;
  final String? avatarUrl;
}
