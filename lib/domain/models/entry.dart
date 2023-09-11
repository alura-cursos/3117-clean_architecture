import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Entry {
  int id;
  String name;
  String image;
  String description;
  String commonLocations;
  String category;

  Entry({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonLocations,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'commonLocations': commonLocations,
      'category': category,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      commonLocations: map['commonLocations'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) => Entry.fromMap(json.decode(source) as Map<String, dynamic>);
}
