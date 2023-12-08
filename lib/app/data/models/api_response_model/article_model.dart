class ArticleData {
  List<ArticleModel>? data;
  Meta? meta;

  ArticleData({this.data, this.meta});

  ArticleData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ArticleModel>[];
      json['data'].forEach((v) {
        data!.add(ArticleModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ?  Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class ArticleModel {
  int? id;
  ArticleAttributes? attributes;

  ArticleModel({this.id, this.attributes});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ?  ArticleAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class ArticleAttributes {
  String? title;
  String? conclusion;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? reviewerName;
  String? readTime;
  String? reviewerEducation;
  String? category;
  String? image;
  String? introduction;
  String? summary;
  String? disclaimer;
  String? reviewerExperience;
  List<References>? references;
  List<BulletPoint>? bulletPoints;
  CustomImage? customImage;
  List<TitleBulletPoint>? titleBulletPoint;
  ReviewerImageResponse? reviewerImageResponse;

  ArticleAttributes(
      {this.title,
        this.conclusion,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.reviewerName,
        this.readTime,
        this.reviewerEducation,
        this.category,
        this.image,
        this.introduction,
        this.summary,
        this.disclaimer,
        this.reviewerExperience,
        this.references,
        this.bulletPoints,
        this.customImage,
        this.titleBulletPoint,
        this.reviewerImageResponse});

  ArticleAttributes.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    conclusion = json['Conclusion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    reviewerName = json['ReviewerName'];
    readTime = json['ReadTime'];
    reviewerEducation = json['ReviewerEducation'];
    category = json['Category'];
    image = json['image'];
    introduction = json['Introduction'];
    summary = json['Summary'];
    disclaimer = json['Disclaimer'];
    reviewerExperience = json['ReviewerExperience'];
    if (json['References'] != null) {
      references = <References>[];
      json['References'].forEach((v) {
        references!.add( References.fromJson(v));
      });
    }
    if (json['BulletPoints'] != null) {
      bulletPoints = <BulletPoint>[];
      json['BulletPoints'].forEach((v) {
        bulletPoints!.add( BulletPoint.fromJson(v));
      });
    }
    customImage = json['CustomImage'] != null
        ? CustomImage.fromJson(json['CustomImage'])
        : null;
    if (json['TitleBulletPoint'] != null) {
      titleBulletPoint = <TitleBulletPoint>[];
      json['TitleBulletPoint'].forEach((v) {
        titleBulletPoint!.add( TitleBulletPoint.fromJson(v));
      });
    }
    reviewerImageResponse = json['ReviewerImage'] != null
        ? ReviewerImageResponse.fromJson(json['ReviewerImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Title'] = title;
    data['Conclusion'] = conclusion;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    data['ReviewerName'] = reviewerName;
    data['ReadTime'] = readTime;
    data['ReviewerEducation'] = reviewerEducation;
    data['Category'] = category;
    data['image'] = image;
    data['Introduction'] = introduction;
    data['Summary'] = summary;
    data['Disclaimer'] = disclaimer;
    data['ReviewerExperience'] = reviewerExperience;
    if (references != null) {
      data['References'] = references!.map((v) => v.toJson()).toList();
    }
    if (bulletPoints != null) {
      data['BulletPoints'] = bulletPoints!.map((v) => v.toJson()).toList();
    }
    if (customImage != null) {
      data['CustomImage'] = customImage!.toJson();
    }
    if (titleBulletPoint != null) {
      data['TitleBulletPoint'] =
          titleBulletPoint!.map((v) => v.toJson()).toList();
    }
    if (reviewerImageResponse != null) {
      data['ReviewerImage'] = reviewerImageResponse!.toJson();
    }
    return data;
  }
}

class References {
  int? id;
  String? singleReferenceLink;

  References({this.id, this.singleReferenceLink});

  References.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    singleReferenceLink = json['SingleReferenceLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['SingleReferenceLink'] = singleReferenceLink;
    return data;
  }
}

class BulletPoint {
  int? id;
  String? title;
  String? description;

  BulletPoint({this.id, this.title, this.description});

  BulletPoint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Title'] = title;
    data['Description'] = description;
    return data;
  }
}

class CustomImage {
  ReviewerImageResponse? reviewerImage;

  CustomImage({this.reviewerImage});

  CustomImage.fromJson(Map<String, dynamic> json) {
    reviewerImage = json['CustomImage'] != null
        ? ReviewerImageResponse.fromJson(json['CustomImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviewerImage != null) {
      data['CustomImage'] = reviewerImage!.toJson();
    }
    return data;
  }
}

class ReviewerImageResponse {
  List<ImageInformation>? data;

  ReviewerImageResponse({this.data});

  ReviewerImageResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ImageInformation>[];
      json['data'].forEach((v) {
        data!.add( ImageInformation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageInformation {
  int? id;
  ImageAttributes? attributes;

  ImageInformation({this.id, this.attributes});

  ImageInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? ImageAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class ImageAttributes {
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  String? previewUrl;
  String? provider;
  String? providerMetadata;
  String? createdAt;
  String? updatedAt;

  ImageAttributes(
      {this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdAt,
        this.updatedAt});

  ImageAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
    json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    if (formats != null) {
      data['formats'] = formats!.toJson();
    }
    data['hash'] = hash;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    data['previewUrl'] = previewUrl;
    data['provider'] = provider;
    data['provider_metadata'] = providerMetadata;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Formats {
  ImageSize? large;
  ImageSize? small;
  ImageSize? medium;
  ImageSize? thumbnail;

  Formats({this.large, this.small, this.medium, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    large = json['large'] != null ?  ImageSize.fromJson(json['large']) : null;
    small = json['small'] != null ?  ImageSize.fromJson(json['small']) : null;
    medium = json['medium'] != null ?  ImageSize.fromJson(json['medium']) : null;
    thumbnail = json['thumbnail'] != null
        ?  ImageSize.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}

class ImageSize {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  String? path;
  double? size;
  int? width;
  int? height;

  ImageSize(
      {this.ext,
        this.url,
        this.hash,
        this.mime,
        this.name,
        this.path,
        this.size,
        this.width,
        this.height});

  ImageSize.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext'] = ext;
    data['url'] = url;
    data['hash'] = hash;
    data['mime'] = mime;
    data['name'] = name;
    data['path'] = path;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class TitleBulletPoint {
  int? id;
  String? mainTitle;
  List<BulletPoint>? bulletPoint;

  TitleBulletPoint({this.id, this.mainTitle, this.bulletPoint});

  TitleBulletPoint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainTitle = json['MainTitle'];
    if (json['BulletPoint'] != null) {
      bulletPoint = <BulletPoint>[];
      json['BulletPoint'].forEach((v) {
        bulletPoint!.add( BulletPoint.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    data['id'] = id;
    data['MainTitle'] = mainTitle;
    if (bulletPoint != null) {
      data['BulletPoint'] = bulletPoint!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class ReviewerImage {
//   List<CustomImage>? data;
//
//   ReviewerImage({this.data});
//
//   ReviewerImage.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <ImageModel>[];
//       json['data'].forEach((v) {
//         data!.add( ImageModel.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return  data;
  }
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({this.page, this.pageSize, this.pageCount, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    pageCount = json['pageCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] =  page;
    data['pageSize'] =  pageSize;
    data['pageCount'] =  pageCount;
    data['total'] = total;
    return data;
  }
}