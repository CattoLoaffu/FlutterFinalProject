class Model {
  String name;
  String type;
  String description;
  String cpu;
  String ram;
  String vga;

  Model(this.name, this.type, this.description, this.cpu, this.ram, this.vga);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'description': description,
      'cpu': cpu,
      'ram': ram,
      'vga': vga
    };
  }
}
