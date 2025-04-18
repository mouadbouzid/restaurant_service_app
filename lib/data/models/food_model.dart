abstract class FoodModel {
  String name;
  String image;
  double price;
  FoodModel(this.image, this.name, this.price);

  String editPrice(double newPrice);
}
