import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class MoviesModel {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
  Data? data;

  MoviesModel(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Results>? results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results extends MovieEntity {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Comics? comics;
  Comics? series;
  Comics? stories;
  Comics? events;
  List<Urls>? urls;

  Results(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.resourceURI,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls})
      : super(
          filmId: id!,
          date: modified.toString(),
          desc: description.toString(),
          movieName: name.toString(),
          image: "${thumbnail!.path.toString()}.${thumbnail.extension.toString()}",
        );
  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      thumbnail: json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null,
      resourceURI: json['resourceURI'],
      comics: json['comics'] != null ? Comics.fromJson(json['comics']) : null,
      series: json['series'] != null ? Comics.fromJson(json['series']) : null,
      stories:
      json['stories'] != null ? Comics.fromJson(json['stories']) : null,
      events: json['events'] != null ? Comics.fromJson(json['events']) : null,
      urls: json['urls'] != null ? List.from(json['urls']).map((e) => Urls.fromJson(e)).toList() : [],
    );
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
}

class Comics {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Comics({this.available, this.collectionURI, this.items, this.returned});

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }
}

class Items {
  String? resourceURI;
  String? name;
  String? type;

  Items({this.resourceURI, this.name, this.type});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }
}

class Urls {
  String? type;
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }
}

// class MovieModel extends MovieEntity {
//   int? id;
//   String? name;
//   String? description;
//   String? modified;
//   Thumbnail? thumbnail;
//   String? resourceURI;
//   Comics? comics;
//   Comics? series;
//   Comics? stories;
//   Comics? events;
//   List<Urls>? urls;
//
//   MovieModel(
//       {this.id,
//       this.name,
//       this.description,
//       this.modified,
//       this.thumbnail,
//       this.resourceURI,
//       this.comics,
//       this.series,
//       this.stories,
//       this.events,
//       this.urls})
//       : super(
//           filmId: id!,
//           date: modified.toString(),
//           desc: description.toString(),
//           movieName: name.toString(),
//           image:
//               "${thumbnail!.path.toString()}.${thumbnail.extension.toString()}",
//         );
//
//   factory MovieModel.fromJson(Map<String, dynamic> json) {
//     return MovieModel(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       modified: json['modified'],
//       thumbnail: json['thumbnail'] != null
//           ? Thumbnail.fromJson(json['thumbnail'])
//           : null,
//       resourceURI: json['resourceURI'],
//       comics: json['comics'] != null ? Comics.fromJson(json['comics']) : null,
//       series: json['series'] != null ? Comics.fromJson(json['series']) : null,
//       stories:
//           json['stories'] != null ? Comics.fromJson(json['stories']) : null,
//       events: json['events'] != null ? Comics.fromJson(json['events']) : null,
//       urls: json['urls'] != null
//           ? List.from(json['urls']).map((e) => Urls.fromJson(e)).toList()
//           : [],
//     );
//   }
// }

// class Thumbnail {
//   String? path;
//   String? extension;
//
//   Thumbnail({this.path, this.extension});
//
//   Thumbnail.fromJson(Map<String, dynamic> json) {
//     path = json['path'];
//     extension = json['extension'];
//   }
// }
//
// class Comics {
//   int? available;
//   String? collectionURI;
//   List<Items>? items;
//   int? returned;
//
//   Comics({this.available, this.collectionURI, this.items, this.returned});
//
//   Comics.fromJson(Map<String, dynamic> json) {
//     available = json['available'];
//     collectionURI = json['collectionURI'];
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(Items.fromJson(v));
//       });
//     }
//     returned = json['returned'];
//   }
// }
//
// class Items {
//   String? resourceURI;
//   String? name;
//   String? type;
//
//   Items({this.resourceURI, this.name});
//
//   Items.fromJson(Map<String, dynamic> json) {
//     resourceURI = json['resourceURI'];
//     name = json['name'];
//     type = json['type'] ?? "";
//   }
// }
//
// class Urls {
//   String? type;
//   String? url;
//
//   Urls({this.type, this.url});
//
//   Urls.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     url = json['url'];
//   }
// }
