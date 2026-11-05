import 'package:ecommerce_simple/ecommerce_simple.dart';
import 'dart:io';

void main(List<String> arguments) {
  // 1. Instanciamos los productos disponibles en el catálogo
  var producto1 = Product('mouse', 15.0);
  var producto2 = Product('teclado', 20.0);
  var producto3 = Product('GPU', 800.0); 

  // 2. Creamos y llenamos la lista de productos para el catálogo
  List<Product> productos = [producto1, producto2, producto3];

  // 3. Instanciamos nuestro carrito de compras (inicia con una lista vacía)
  var miCarrito = Cart([]);

  // Menu de la consola: 
  bool continuar = true; 

  while (continuar) {
    print('\n==== Ecommerce Simple ====');
    print('---- Lista de productos ----');
    
    // Mostramos los productos disponibles con su respectiva letra de opción
    print('a. ${producto1.nombre} - \$${producto1.precio}');
    print('b. ${producto2.nombre} - \$${producto2.precio}');
    print('c. ${producto3.nombre} - \$${producto3.precio}');
    print('v. Mostrar el contenido del carrito'); 
    print('p. Pagar y salir');
    stdout.write('Elige una opción: ');

    // Leemos lo que el usuario escribe en la consola
    String? opcion = stdin.readLineSync();

    // Utilizamos switch para evaluar la opción elegida
    switch (opcion) {
      case 'a':
        // Por simplicidad, agregamos 1 unidad del producto 1 al carrito
        miCarrito.agregar(Item(producto1, 1));
        print('-> ¡${producto1.nombre} agregado al carrito!');
        break;

      case 'b':
        miCarrito.agregar(Item(producto2, 1));
        print('-> ¡${producto2.nombre} agregado al carrito!');
        break;

      case 'c':
        miCarrito.agregar(Item(producto3, 1));
        print('-> ¡${producto3.nombre} agregado al carrito!');
        break;

      case 'v':
        print('\n--- CONTENIDO ACTUAL DEL CARRITO ---');
        if (miCarrito.items.isEmpty) {
          print('El carrito está vacío.');
        } else {
          for (var item in miCarrito.items) {
            print('${item.cantidad} x ${item.producto.nombre} .... \$${(item.producto.precio * item.cantidad).toStringAsFixed(2)}');
          }
          print('Total parcial: \$${miCarrito.calcularTotal().toStringAsFixed(2)}');
        }
        break;

      case 'p':
        print('\n--- TICKET DE COMPRA ---');
        if (miCarrito.items.isEmpty) {
          print('No compraste ningún producto.');
        } else {
          for (var item in miCarrito.items) {
            double subtotal = item.producto.precio * item.cantidad;
            print('${item.cantidad} x ${item.producto.nombre} ..... \$${subtotal.toStringAsFixed(2)}');
          }
          print('------------------------');
          print('TOTAL ........... \$${miCarrito.calcularTotal().toStringAsFixed(2)}');
        }
        print('¡Gracias por tu compra! Saliendo...');
        continuar = false; // Rompe el ciclo while y termina el programa
        break;

      default:
        print('\n⚠️ Opción inválida. Por favor, elige una opción correcta (a, b, c, v, p).');
    }
  }
}


