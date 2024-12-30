class InfoData {
  final int id;
  final String assetID;
  final String title;
  final String header;
  final String subtitle;

  InfoData({
    required this.id,
    required this.assetID,
    required this.title,
    required this.header,
    required this.subtitle,
  });

  /// Factory constructor to create an instance from a JSON map.
  factory InfoData.fromJson(Map<String, dynamic> json) {
    return InfoData(
      id: json['id'],
      assetID: json['assetID'],
      title: json['title'],
      header: json['header'],
      subtitle: json['subtitle'],
    );
  }

  /// Converts the instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'assetID': assetID,
      'title': title,
      'header': header,
      'subtitle': subtitle,
    };
  }
}

class InfoDataList {
  final List<InfoData> data;

  InfoDataList({required this.data});

  /// Factory constructor to create a list of `InfoData` from a JSON map.
  factory InfoDataList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<InfoData> dataList = list.map((item) => InfoData.fromJson(item)).toList();
    return InfoDataList(data: dataList);
  }

  /// Converts the list of instances to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}