import 'package:equatable/equatable.dart';

class EphemeralKeyModel extends Equatable {
  final String id;
  final String object;
  final List<AssociatedObjectModel> associatedObjects;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  const EphemeralKeyModel({
    required this.id,
    required this.object,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String? ?? '',
      object: json['object'] as String? ?? '',
      associatedObjects: (json['associated_objects'] as List? ?? [])
          .map((e) => AssociatedObjectModel.fromJson(e))
          .toList(),
      created: json['created'] as int? ?? 0,
      expires: json['expires'] as int? ?? 0,
      livemode: json['livemode'] as bool? ?? false,
      secret: json['secret'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        object,
        associatedObjects,
        created,
        expires,
        livemode,
        secret,
      ];
}

class AssociatedObjectModel extends Equatable {
  final String id;
  final String type;

  const AssociatedObjectModel({
    required this.id,
    required this.type,
  });

  factory AssociatedObjectModel.fromJson(Map<String, dynamic> json) {
    return AssociatedObjectModel(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, type];
}
