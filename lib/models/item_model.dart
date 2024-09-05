class TableModel {
  final String id;
  final String name;
  final bool isOccupied;

  TableModel({required this.id, required this.name, required this.isOccupied});
}

class MenuModel {
  final String id;
  final String name;
  final double price;

  MenuModel({
    required this.id,
    required this.name,
    required this.price,
  });
}
