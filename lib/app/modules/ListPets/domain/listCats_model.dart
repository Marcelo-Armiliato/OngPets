import '../../utils/fields.dart';

class ListCatsModel {
  ListCatsModel({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
    this.image,
  });
  Weight? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;
  Image? image;

  ListCatsModel.fromJson(Map<String, dynamic> json) {
    weight = Weight.fromJson(json['weight']);
    id = json['id'];
    name = json['name'];
    cfaUrl = json['cfa_url'];
    vetstreetUrl = json['vetstreet_url'];
    vcahospitalsUrl = json['vcahospitals_url'];
    temperament = json['temperament'];
    origin = json['origin'];
    countryCodes = json['country_codes'];
    countryCode = json['country_code'];
    description = json['description'];
    lifeSpan = json['life_span'];
    //   // indoor = json['indoor'];
    //   // lap = json['lap'];
    //   // altNames = json['alt_names'];
    //   // adaptability = json['adaptability'];
    //   // affectionLevel = json['affection_level'];
    //   // childFriendly = json['child_friendly'];
    //   // dogFriendly = json['dog_friendly'];
    //   // energyLevel = json['energy_level'];
    //   // grooming = json['grooming'];
    //   // healthIssues = json['health_issues'];
    //   // intelligence = json['intelligence'];
    //   // sheddingLevel = json['shedding_level'];
    //   // socialNeeds = json['social_needs'];
    //   // strangerFriendly = json['stranger_friendly'];
    //   // vocalisation = json['vocalisation'];
    //   // experimental = json['experimental'];
    //   // hairless = json['hairless'];
    //   // natural = json['natural'];
    //   // rare = json['rare'];
    //   // rex = json['rex'];
    //   // suppressedTail = json['suppressed_tail'];
    //   // shortLegs = json['short_legs'];
    wikipediaUrl = json['wikipedia_url'];
    hypoallergenic = json['hypoallergenic'];
    referenceImageId = json['reference_image_id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['weight'] = weight?.toJson();
    _data['id'] = id;
    _data['name'] = name;
    _data['cfa_url'] = cfaUrl;
    _data['vetstreet_url'] = vetstreetUrl;
    _data['vcahospitals_url'] = vcahospitalsUrl;
    _data['temperament'] = temperament;
    _data['origin'] = origin;
    _data['country_codes'] = countryCodes;
    _data['country_code'] = countryCode;
    _data['description'] = description;
    _data['life_span'] = lifeSpan;
    _data['indoor'] = indoor;
    _data['lap'] = lap;
    _data['alt_names'] = altNames;
    _data['adaptability'] = adaptability;
    _data['affection_level'] = affectionLevel;
    _data['child_friendly'] = childFriendly;
    _data['dog_friendly'] = dogFriendly;
    _data['energy_level'] = energyLevel;
    _data['grooming'] = grooming;
    _data['health_issues'] = healthIssues;
    _data['intelligence'] = intelligence;
    _data['shedding_level'] = sheddingLevel;
    _data['social_needs'] = socialNeeds;
    _data['stranger_friendly'] = strangerFriendly;
    _data['vocalisation'] = vocalisation;
    _data['experimental'] = experimental;
    _data['hairless'] = hairless;
    _data['natural'] = natural;
    _data['rare'] = rare;
    _data['rex'] = rex;
    _data['suppressed_tail'] = suppressedTail;
    _data['short_legs'] = shortLegs;
    _data['wikipedia_url'] = wikipediaUrl;
    _data['hypoallergenic'] = hypoallergenic;
    _data['reference_image_id'] = referenceImageId;
    _data['image'] = image?.toJson();
    return _data;
  }
}

class Weight {
  Weight({
    this.imperial,
    this.metric,
  });
  String? imperial;
  String? metric;

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }
  factory Weight.fromMap(Map<String, dynamic> map) {
    final f = Fields(map);
    return Weight(
      imperial: f.getString('imperial'),
      metric: f.getString('metric'),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imperial'] = imperial;
    _data['metric'] = metric;
    return _data;
  }
}

class Image {
  Image({
    this.id,
    this.width,
    this.height,
    this.url,
  });
  String? id;
  int? width;
  int? height;
  String? url;

  Image.fromJson(Map<String?, dynamic> json) {
    id = json['id'] ?? "0XYvRd7oD";
    width = json['width'] ?? 1204;
    height = json['height'] ?? 1445;
    url = json['url'] ?? 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id ?? "0XYvRd7oD";
    _data['width'] = width ?? 1204;
    _data['height'] = height ?? 1445;
    _data['url'] = url ?? 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg';
    return _data;
  }
}
