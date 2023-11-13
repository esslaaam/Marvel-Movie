import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
  Data? data;

  MovieDetailsModel(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data})
      : super(
            filmId: data!.results![0].id!,
            date: data.results![0].modified.toString(),
            desc: data.results![0].description.toString(),
            movieName: data.results![0].name.toString(),
            image: "${data.results![0].thumbnail!.path.toString()}.${data.results![0].thumbnail!.extension.toString()}",
            numbersOfComics: data.results![0].comics!.available!,
            numbersOfEvents: data.results![0].events!.available!,
            numbersOfSeries: data.results![0].series!.available!,
            numbersOfStories: data.results![0].stories!.available!);

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHTML: json['attributionHTML'],
        etag: json['etag'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
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

class Results {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Comics? comics;
  Series? series;
  Stories? stories;
  Events? events;
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
      this.urls});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics = json['comics'] != null ? Comics.fromJson(json['comics']) : null;
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
    stories =
        json['stories'] != null ? Stories.fromJson(json['stories']) : null;
    events = json['events'] != null ? Events.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
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

class Series {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Series({this.available, this.collectionURI, this.items, this.returned});

  Series.fromJson(Map<String, dynamic> json) {
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

class Stories {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Stories({this.available, this.collectionURI, this.items, this.returned});

  Stories.fromJson(Map<String, dynamic> json) {
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

class Events {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Events({this.available, this.collectionURI, this.items, this.returned});

  Events.fromJson(Map<String, dynamic> json) {
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
