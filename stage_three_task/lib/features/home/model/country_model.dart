import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  bool? independent;
  Status? status;
  bool? unMember;
  Map<String, Currency>? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  Region? region;
  Map<String, String>? languages;
  Map<String, Translation>? translations;
  List<double>? latlng;
  bool? landlocked;
  double? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  Car? car;
  List<String>? timezones;
  List<Continent>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  StartOfWeek? startOfWeek;
  CapitalInfo? capitalInfo;
  String? cioc;
  String? subregion;
  String? fifa;
  List<String>? borders;
  Map<String, double>? gini;
  PostalCode? postalCode;

  CountryModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.cioc,
    this.subregion,
    this.fifa,
    this.borders,
    this.gini,
    this.postalCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"] != null ? Name.fromJson(json["name"]) : null,
        tld: json["tld"] != null
            ? List<String>.from(json["tld"].map((x) => x))
            : [],
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        independent: json["independent"],
        status:
            json["status"] != null ? statusValues.map[json["status"]] : null,
        unMember: json["unMember"],
        currencies: json["currencies"] != null
            ? (json["currencies"] as Map<String, dynamic>).map(
                (k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v)))
            : null,
        idd: json["idd"] != null ? Idd.fromJson(json["idd"]) : null,
        capital: json["capital"] != null
            ? List<String>.from(json["capital"].map((x) => x))
            : [],
        altSpellings: json["altSpellings"] != null
            ? List<String>.from(json["altSpellings"].map((x) => x))
            : [],
        region:
            json["region"] != null ? regionValues.map[json["region"]] : null,
        languages: json["languages"] != null
            ? Map<String, String>.from(json["languages"])
            : null,
        translations: json["translations"] != null
            ? (json["translations"] as Map<String, dynamic>).map((k, v) =>
                MapEntry<String, Translation>(k, Translation.fromJson(v)))
            : null,
        latlng: json["latlng"] != null
            ? List<double>.from(json["latlng"].map((x) =>
                x is num ? x.toDouble() : double.tryParse(x.toString()) ?? 0.0))
            : [],
        landlocked: json["landlocked"],
        area: json["area"] != null ? (json["area"] as num).toDouble() : null,
        demonyms: json["demonyms"] != null
            ? Demonyms.fromJson(json["demonyms"])
            : null,
        flag: json["flag"],
        maps: json["maps"] != null ? Maps.fromJson(json["maps"]) : null,
        population: json["population"],
        car: json["car"] != null ? Car.fromJson(json["car"]) : null,
        timezones: json["timezones"] != null
            ? List<String>.from(json["timezones"].map((x) => x))
            : [],
        continents: json["continents"] != null
            ? List<Continent>.from(json["continents"]
                .map((x) => continentValues.map[x] ?? Continent.AFRICA))
            : [],
        flags: json["flags"] != null ? Flags.fromJson(json["flags"]) : null,
        coatOfArms: json["coatOfArms"] != null
            ? CoatOfArms.fromJson(json["coatOfArms"])
            : null,
        startOfWeek: json["startOfWeek"] != null
            ? startOfWeekValues.map[json["startOfWeek"]]
            : null,
        capitalInfo: json["capitalInfo"] != null
            ? CapitalInfo.fromJson(json["capitalInfo"])
            : null,
        cioc: json["cioc"],
        subregion: json["subregion"],
        fifa: json["fifa"],
        borders: json["borders"] != null
            ? List<String>.from(json["borders"].map((x) => x))
            : [],
        gini: json["gini"] != null
            ? (json["gini"] as Map<String, dynamic>).map(
                (k, v) => MapEntry<String, double>(k, (v as num).toDouble()))
            : null,
        postalCode: json["postalCode"] != null
            ? PostalCode.fromJson(json["postalCode"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "tld": tld,
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "independent": independent,
        "status": status != null ? statusValues.reverse[status] : null,
        "unMember": unMember,
        "currencies": currencies != null
            ? currencies!
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson()))
            : null,
        "idd": idd?.toJson(),
        "capital": capital,
        "altSpellings": altSpellings,
        "region": region != null ? regionValues.reverse[region] : null,
        "languages": languages,
        "translations": translations != null
            ? translations!
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson()))
            : null,
        "latlng": latlng,
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms?.toJson(),
        "flag": flag,
        "maps": maps?.toJson(),
        "population": population,
        "car": car?.toJson(),
        "timezones": timezones,
        "continents": continents != null
            ? continents!.map((x) => continentValues.reverse[x]).toList()
            : null,
        "flags": flags?.toJson(),
        "coatOfArms": coatOfArms?.toJson(),
        "startOfWeek":
            startOfWeek != null ? startOfWeekValues.reverse[startOfWeek] : null,
        "capitalInfo": capitalInfo?.toJson(),
        "cioc": cioc,
        "subregion": subregion,
        "fifa": fifa,
        "borders": borders,
        "gini": gini,
        "postalCode": postalCode?.toJson(),
      };
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({
    this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] != null
            ? List<double>.from(json["latlng"].map((x) =>
                x is num ? x.toDouble() : double.tryParse(x.toString()) ?? 0.0))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "latlng": latlng,
      };
}

class Car {
  List<String>? signs;
  Side? side;

  Car({
    this.signs,
    this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] != null
            ? List<String>.from(json["signs"].map((x) => x))
            : [],
        side: json["side"] != null ? sideValues.map[json["side"]] : null,
      );

  Map<String, dynamic> toJson() => {
        "signs": signs,
        "side": side != null ? sideValues.reverse[side] : null,
      };
}

enum Side { LEFT, RIGHT }

final sideValues = EnumValues({"left": Side.LEFT, "right": Side.RIGHT});

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

enum Continent {
  AFRICA,
  ANTARCTICA,
  ASIA,
  EUROPE,
  NORTH_AMERICA,
  OCEANIA,
  SOUTH_AMERICA
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Antarctica": Continent.ANTARCTICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
});

class Currency {
  String? name;
  String? symbol;

  Currency({
    this.name,
    this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({
    this.eng,
    this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: json["eng"] != null ? Eng.fromJson(json["eng"]) : null,
        fra: json["fra"] != null ? Eng.fromJson(json["fra"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "eng": eng?.toJson(),
        "fra": fra?.toJson(),
      };
}

class Eng {
  String? f;
  String? m;

  Eng({
    this.f,
    this.m,
  });

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] != null
            ? List<String>.from(json["suffixes"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": suffixes,
      };
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  String? common;
  String? official;
  Map<String, Translation>? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] != null
            ? (json["nativeName"] as Map<String, dynamic>).map((k, v) =>
                MapEntry<String, Translation>(k, Translation.fromJson(v)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName != null
            ? nativeName!
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson()))
            : null,
      };
}

class Translation {
  String? official;
  String? common;

  Translation({
    this.official,
    this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({
    this.format,
    this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

enum Region { AFRICA, AMERICAS, ANTARCTIC, ASIA, EUROPE, OCEANIA }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

enum StartOfWeek { MONDAY, SATURDAY, SUNDAY }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

enum Status { OFFICIALLY_ASSIGNED, USER_ASSIGNED }

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
