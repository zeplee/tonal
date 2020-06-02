import 'package:tonal/common/helper/helper.dart';

class CommonRepo {
  static getRecommendData() {
    return NetHelper.get(
        path: "/xc_recommend/recommend/homepage/homePageHotRecommendV2.do");
  }
}
