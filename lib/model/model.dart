class Model {
  String name;
  String type;
  String description;
  String ram;
  String cpu;
  String vga;

  Model(this.name, this.type, this.description, this.cpu, this.ram, this.vga);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'description': description,
      'ram': ram,
      'cpu': cpu,
      'vga': vga
    };
  }
}
