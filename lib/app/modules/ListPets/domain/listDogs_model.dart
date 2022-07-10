class ListDogsModel {
  ListDogsModel({
    this.weight,
    this.height,
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.referenceImageId,
    this.image,
  });
  Weight? weight;
  Height? height;
  int? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;
  Image? image;

  ListDogsModel.fromJson(Map<String, dynamic> json) {
    weight = Weight.fromJson(json['weight']);
    height = Height.fromJson(json['height']);
    id = json['id'];
    name = json['name'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
    image = Image.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['weight'] = weight?.toJson();
    _data['height'] = height?.toJson();
    _data['id'] = id;
    _data['name'] = name;
    _data['bred_for'] = bredFor;
    _data['breed_group'] = breedGroup;
    _data['life_span'] = lifeSpan;
    _data['temperament'] = temperament;
    _data['origin'] = origin;
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imperial'] = imperial;
    _data['metric'] = metric;
    return _data;
  }
}

class Height {
  Height({
    this.imperial,
    this.metric,
  });
  String? imperial;
  String? metric;

  Height.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
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

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['width'] = width;
    _data['height'] = height;
    _data['url'] = url;
    return _data;
  }
}
