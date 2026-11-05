class Product {
  String nombre;
  double precio; 

  Product(this.nombre, this.precio);
}

class Item {
  Product producto;
  int cantidad;

  Item(this.producto, this.cantidad);
}

class Cart {
  List<Item> items;

  // Constructor 
  Cart(this.items); 

  // Método para añadir un item al carrito
  int agregar(Item item) {
    items.add(item);
    return items.length;  
  }

  // Método para calcular el total acumulado
  double calcularTotal() {
    double total = 0.0;
    for (var i in items) {
      total += i.producto.precio * i.cantidad;
    }
    return total;
  }
}
