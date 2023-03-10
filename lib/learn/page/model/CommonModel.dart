/**
 * https://www.devio.org/io/flutter_app/json/test_common_model.json
 */
class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  const CommonModel(
      {this.icon = "",
        this.title = "",
        this.url = "",
        this.statusBarColor = "",
        this.hideAppBar = false});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar']);
  }

  @override
  String toString() {
    return 'CommonModel{icon: $icon, title: $title, url: $url, statusBarColor: $statusBarColor, hideAppBar: $hideAppBar}';
  }
}
