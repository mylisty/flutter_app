class AccountList {
  String accountId;
  String corpId;
  String phone;
  String name;
  String avatar;
  String position;
  String email;
  String orgId;
  String username;
  bool select = false;

  AccountList(
      {this.accountId,
      this.corpId,
      this.phone,
      this.name,
      this.avatar,
      this.position,
      this.email,
      this.orgId,
      this.select = false,
      this.username});

  AccountList.fromJson(dynamic json) {
    accountId = json["accountId"];
    corpId = json["corpId"];
    phone = json["phone"];
    name = json["name"];
    avatar = json["avatar"];
    position = json["position"];
    email = json["email"];
    orgId = json["orgId"];
    username = json["username"];
    select = json["select"] ?? false;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["accountId"] = accountId;
    map["corpId"] = corpId;
    map["phone"] = phone;
    map["name"] = name;
    map["avatar"] = avatar;
    map["position"] = position;
    map["email"] = email;
    map["orgId"] = orgId;
    map["username"] = username;
    map["select"] = select;
    return map;
  }
}

class Children {
  List<Children> children;
  List<AccountList> accountList;
  String name;
  String orgId;
  String parentId;

  Children(
      {this.children, this.accountList, this.name, this.orgId, this.parentId});

  Children.fromJson(dynamic json) {
    if (json["children"] != null) {
      children = [];
      json["children"].forEach((v) {
        children.add(Children.fromJson(v));
      });
    }
    if (json["accountList"] != null) {
      accountList = [];
      json["accountList"].forEach((v) {
        accountList.add(AccountList.fromJson(v));
      });
    }
    name = json["name"];
    orgId = json["orgId"];
    parentId = json["parentId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (children != null) {
      map["children"] = children.map((v) => v.toJson()).toList();
    }
    if (accountList != null) {
      map["accountList"] = accountList.map((v) => v.toJson()).toList();
    }
    map["name"] = name;
    map["orgId"] = orgId;
    map["parentId"] = parentId;
    return map;
  }
}
