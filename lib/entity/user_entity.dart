class UserEntity {
  int elapsed;
  String data;
  dynamic trackId;
  String version;
  String timestamp;
  int status;
  String errorMsg;

  UserEntity(
      {this.elapsed,
      this.data,
      this.trackId,
      this.version,
      this.timestamp,
      this.status,
      this.errorMsg});

  UserEntity.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    data = json['data'];
    trackId = json['trackId'];
    version = json['version'];
    timestamp = json['timestamp'];
    status = json['status'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elapsed'] = this.elapsed;
    data['data'] = this.data;
    data['trackId'] = this.trackId;
    data['version'] = this.version;
    data['timestamp'] = this.timestamp;
    data['status'] = this.status;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
