class Welcome {
  double? score;
  Show? show;

  Welcome({
    this.score,
    this.show,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      score: json['score']?.toDouble(),
      show: json['show'] != null ? Show.fromJson(json['show']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'score': score,
        'show': show?.toJson(),
      };
}

class Show {
  int? id;
  String? url;
  String? name;
  Type? type;
  Language? language;
  List<String>? genres;
  Status? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  Network? webChannel;
  dynamic dvdCountry;
  Externals? externals;
  ShowImage? image; // Renamed to avoid conflict with Flutter's Image
  String? summary;
  int? updated;
  Links? links;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      type: json['type'] != null
          ? Type.values.firstWhere(
              (e) =>
                  e.toString().split('.').last.toUpperCase() ==
                  json['type'].toString().toUpperCase(),
              orElse: () => Type.SCRIPTED) // Set default if enum doesn't match
          : null,
      language: json['language'] != null
          ? Language.values.firstWhere(
              (e) =>
                  e.toString().split('.').last.toUpperCase() ==
                  json['language'].toString().toUpperCase(),
              orElse: () => Language
                  .ENGLISH) // Set a default value if the language isn't found
          : null,
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
      status: json['status'] != null
          ? Status.values.firstWhere(
              (e) =>
                  e.toString().split('.').last.toUpperCase() ==
                  json['status'].toString().toUpperCase(),
              orElse: () => Status.RUNNING) // Default to RUNNING if not found
          : null,
      runtime: json['runtime'],
      averageRuntime: json['averageRuntime'],
      premiered:
          json['premiered'] != null ? DateTime.parse(json['premiered']) : null,
      ended: json['ended'] != null ? DateTime.parse(json['ended']) : null,
      officialSite: json['officialSite'],
      schedule:
          json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      weight: json['weight'],
      network:
          json['network'] != null ? Network.fromJson(json['network']) : null,
      webChannel: json['webChannel'] != null
          ? Network.fromJson(json['webChannel'])
          : null,
      dvdCountry: json['dvdCountry'],
      externals: json['externals'] != null
          ? Externals.fromJson(json['externals'])
          : null,
      image: json['image'] != null ? ShowImage.fromJson(json['image']) : null,
      summary: json['summary'],
      updated: json['updated'],
      links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'name': name,
        'type': type?.name,
        'language': language?.name,
        'genres': genres,
        'status': status?.name,
        'runtime': runtime,
        'averageRuntime': averageRuntime,
        'premiered': premiered?.toIso8601String(),
        'ended': ended?.toIso8601String(),
        'officialSite': officialSite,
        'schedule': schedule?.toJson(),
        'rating': rating?.toJson(),
        'weight': weight,
        'network': network?.toJson(),
        'webChannel': webChannel?.toJson(),
        'dvdCountry': dvdCountry,
        'externals': externals?.toJson(),
        'image': image?.toJson(),
        'summary': summary,
        'updated': updated,
        '_links': links?.toJson(),
      };
}

class Externals {
  dynamic tvrage;
  int? thetvdb;
  String? imdb;

  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json['tvrage'],
      thetvdb: json['thetvdb'],
      imdb: json['imdb'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tvrage': tvrage,
        'thetvdb': thetvdb,
        'imdb': imdb,
      };
}

class ShowImage {
  String? medium;
  String? original;

  ShowImage({
    this.medium,
    this.original,
  });

  factory ShowImage.fromJson(Map<String, dynamic> json) {
    return ShowImage(
      medium: json['medium'],
      original: json['original'],
    );
  }

  Map<String, dynamic> toJson() => {
        'medium': medium,
        'original': original,
      };
}

class Links {
  Self? self;
  Previousepisode? previousepisode;

  Links({
    this.self,
    this.previousepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] != null ? Self.fromJson(json['self']) : null,
      previousepisode: json['previousepisode'] != null
          ? Previousepisode.fromJson(json['previousepisode'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'self': self?.toJson(),
        'previousepisode': previousepisode?.toJson(),
      };
}

class Previousepisode {
  String? href;

  Previousepisode({
    this.href,
  });

  factory Previousepisode.fromJson(Map<String, dynamic> json) {
    return Previousepisode(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}

class Self {
  String? href;

  Self({
    this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}

class Network {
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
      officialSite: json['officialSite'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country?.toJson(),
        'officialSite': officialSite,
      };
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({
    this.name,
    this.code,
    this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'timezone': timezone,
      };
}

class Schedule {
  String? time;
  List<String>? days;

  Schedule({
    this.time,
    this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: json['days'] != null ? List<String>.from(json['days']) : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'time': time,
        'days': days,
      };
}

class Rating {
  double? average;

  Rating({
    this.average,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'average': average,
      };
}

enum Language { ENGLISH }

enum Status { ENDED, IN_DEVELOPMENT, RUNNING }

enum Type { DOCUMENTARY, SCRIPTED, VARIETY }
