class Card {
  final String id;
  final String name;
  final String price;
  final String tag;
  final String description;

  Card({
    required this.id,
    required this.name,
    required this.price,
    required this.tag,
    required this.description,
  });

  Card copyWidth({
    String? id,
    String? name,
    String? price,
    String? tag,
    String? description,
  }) {
    return Card(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      tag: tag ?? this.tag,
      description: description ?? this.description,
    );
  }
}
