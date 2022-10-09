class UserModel {
  String? nid;
  String? name;
  int? submit;

  UserModel({this.name, this.nid, this.submit});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      nid: map['NationalID'],
      name: map['Name'],
      submit: map['Submited'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'NationalID': nid,
      'Name': name,
      'Submited': submit,
    };
  }
}
class Can {
  int? votes;
  Can({this.votes});

  factory Can.fromMap(map) {return Can(votes: map['votes'],);}

  Map<String, dynamic> toMap() {return {'votes': votes,};
}
}