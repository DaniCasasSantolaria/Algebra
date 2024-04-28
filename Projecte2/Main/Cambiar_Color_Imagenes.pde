void changeColorBackground(PImage image){
  for(int i=0;i<image.width;i++){ // Recorremos las X (las columnas)
    for(int j=0;j<image.height;j++){ // Recorremos las Y (las filas)
      // Ahora estamos en un pixel concreto de la imagen
      // Vamos a cambiar el pixel según una LUT
      // 1- Cogemos el color del pixel
      color colorPixel = image.get(i,j);
      // 2- Cambiamos el color
      if(red(colorPixel) < 50 && green(colorPixel) < 50 && blue(colorPixel) < 50){
        colorPixel = color(75, 73, 71); // R, G y B son iguales pq es un gris
        image.set(i,j,colorPixel);
      }
      else{
        float luma = 0.299*red(colorPixel)
        + 0.587*green(colorPixel) + 0.114*blue(colorPixel);
        colorPixel = color(luma, luma, luma); // R, G y B son iguales pq es un gris
        // 3- Guardamos el color modificado en el pixel
        image.set(i,j,colorPixel);
      }
    }
  }
}

PImage applyGreenFilter(PImage image, int red, int green, int blue) {
  PImage imagenFiltrada = createImage(image.width, image.height, RGB); // Crear una nueva imagen para almacenar la imagen filtrada
  imagenFiltrada.loadPixels(); // Cargar los píxeles de la nueva imagen

  atari.loadPixels(); // Cargar los píxeles de la imagen original
  for (int i = 0; i < image.pixels.length; i++) {
    // Extraer los componentes de color RGB de cada píxel
    float r = red(image.pixels[i]);
    float g = green(image.pixels[i]);
    float b = blue(image.pixels[i]);

    // Aplicar el filtro verde: aumentar la componente verde
    r = max(r, red);
    g = max(g, green); // Aumentar el valor verde
    b = max(b, blue);

    // Combinar los componentes de color para formar el nuevo color y asignarlo a la nueva imagen
    imagenFiltrada.pixels[i] = color(r, g, b);
  }

  imagenFiltrada.updatePixels(); // Actualizar la nueva imagen con los nuevos píxeles

  return imagenFiltrada; // Devolver la imagen filtrada
}
