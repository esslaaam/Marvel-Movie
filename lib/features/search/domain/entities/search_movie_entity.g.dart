// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchMovieEntityAdapter extends TypeAdapter<SearchMovieEntity> {
  @override
  final int typeId = 2;

  @override
  SearchMovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchMovieEntity(
      image: fields[1] as String?,
      movieName: fields[2] as String,
      date: fields[3] as String?,
      desc: fields[4] as String?,
      filmId: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SearchMovieEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.filmId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.movieName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchMovieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
