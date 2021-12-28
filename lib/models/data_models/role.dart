class Role {
  int id;
  String name;
  Role({required this.id, required this.name});
  factory Role.initEmpty() {
    return Role(id: -1, name: "");
  }
}
