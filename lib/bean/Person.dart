import 'package:json_annotation/json_annotation.dart';
part 'g.dart';

@JsonSerializable(nullable: false)
class Person {
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  Person({this.firstName, this.lastName, this.dateOfBirth});
  factory Person.fromJson(Map<String, dynamic> json) => personFromJson(json);
  Map<String, dynamic> toJson() => personToJson(this);
}

// Person _$PersonFromJson(Map<String, dynamic> json) {
//   return Person(
//       firstName: json['firstName'] as String,
//       lastName: json['lastName'] as String,
//       dateOfBirth: DateTime.parse(json['dateOfBirth'] as String));
// }

// Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
//       'firstName': instance.firstName,
//       'lastName': instance.lastName,
//       'dateOfBirth': instance.dateOfBirth.toIso8601String()
//     };