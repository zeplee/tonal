class CategoryEntity {
	int id;
	String title;
	String body;
	int userId;

	CategoryEntity({this.id, this.title, this.body, this.userId});

	CategoryEntity.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		body = json['body'];
		userId = json['userId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['title'] = this.title;
		data['body'] = this.body;
		data['userId'] = this.userId;
		return data;
	}
}
