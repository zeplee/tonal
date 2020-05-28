class ResultEntity {
  int code;
  String msg;
  var data;
  var headers;

  ResultEntity(this.code, this.msg, this.data, {this.headers});

  ResultEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['result'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'data': data,
      };
}
