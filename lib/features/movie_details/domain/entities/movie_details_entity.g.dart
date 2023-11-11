// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsEntityAdapter extends TypeAdapter<MovieDetailsEntity> {
  @override
  final int typeId = 1;

  @override
  MovieDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsEntity(
      filmId: fields[0] as int,
      image: fields[1] as String?,
      movieName: fields[2] as String,
      date: fields[3] as String?,
      desc: fields[4] as String?,
      numbersOfComics: fields[5] as int?,
      numbersOfSeries: fields[6] as int?,
      numbersOfStories: fields[7] as int?,
      numbersOfEvents: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.filmId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.movieName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.desc)
      ..writeByte(5)
      ..write(obj.numbersOfComics)
      ..writeByte(6)
      ..write(obj.numbersOfSeries)
      ..writeByte(7)
      ..write(obj.numbersOfStories)
      ..writeByte(8)
      ..write(obj.numbersOfEvents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
