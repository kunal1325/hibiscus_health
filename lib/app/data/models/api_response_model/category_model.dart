class CategoryData {
  List<CategoryModel>? data;
  CategoryMeta? meta;

  CategoryData({this.data, this.meta});

  CategoryData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryModel>[];
      json['data'].forEach((v) {
        data!.add(CategoryModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? CategoryMeta.fromJson(json['meta']) : null;
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

class CategoryModel {
  int? id;
  CategoryAttributes? attributes;

  CategoryModel({this.id, this.attributes});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? CategoryAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class CategoryAttributes {
  String? categoryName;

  CategoryAttributes({this.categoryName});

  CategoryAttributes.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    return data;
  }
}

class CategoryMeta {
  CategoryPagination? pagination;

  CategoryMeta({this.pagination});

  CategoryMeta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? CategoryPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class CategoryPagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  CategoryPagination({this.page, this.pageSize, this.pageCount, this.total});

  CategoryPagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    pageCount = json['pageCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['pageCount'] = pageCount;
    data['total'] = total;
    return data;
  }
}
