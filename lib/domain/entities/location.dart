import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String? city;
  final String? country;

  const LocationEntity({
    this.city,
    this.country,
  });

  @override
  List<Object?> get props => [city, country];
}
