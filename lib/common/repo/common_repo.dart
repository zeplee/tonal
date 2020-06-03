import 'package:flutter_base/helper/helper.dart';

class CommonRepo {
  static getRecommendData() {
    return NetHelper.request(
        path: "/xc_recommend/recommend/homepage/homePageHotRecommendV2.do");
  }
}
