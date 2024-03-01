// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Saves {
  String name;
  String createBy;
  int calories;
  Saves(
    this.name,
    this.createBy,
    this.calories,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'create_by': createBy,
      'calories': calories,
    };
  }

  factory Saves.fromMap(Map<String, dynamic> map) {
    return Saves(
      map['name'] as String,
      map['create_by'] as String,
      map['calories'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Saves.fromJson(String source) =>
      Saves.fromMap(json.decode(source) as Map<String, dynamic>);

  Saves copyWith({
    String? name,
    String? createBy,
    int? calories,
  }) {
    return Saves(
      name ?? this.name,
      createBy ?? this.createBy,
      calories ?? this.calories,
    );
  }

  @override
  String toString() =>
      'Saves(name: $name, create_by: $createBy, calories: $calories)';

  @override
  bool operator ==(covariant Saves other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.createBy == createBy &&
        other.calories == calories;
  }

  @override
  int get hashCode => name.hashCode ^ createBy.hashCode ^ calories.hashCode;
}
