import 'package:flutter_base/flutter_base.dart';

class CommonRepo {
  static getRecommendData() {
    return NetHelper.request(
        path: "/xc_recommend/recommend/homepage/homePageHotRecommendV2.do");
  }
}
