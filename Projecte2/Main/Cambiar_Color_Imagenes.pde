void changeColorBackground(PImage image){
  for(int i=0;i<image.width;i++){ // Recorremos las X (las columnas)
    for(int j=0;j<image.height;j++){ // Recorremos las Y (las filas)
      // Ahora estamos en un pixel concreto de la imagen
      // Vamos a cambiar el pixel según una LUT
      // 1- Cogemos el color del pixel
      color colorPixel = image.get(i,j);
      // 2- Cambiamos el color
      float luma = 0.299*red(colorPixel)
      + 0.587*green(colorPixel) + 0.114*blue(colorPixel);
      colorPixel = color(0, 255 - luma, 0); // R, G y B son iguales pq es un gris
      // 3- Guardamos el color modificado en el pixel
      image.set(i,j,colorPixel);
    }
  }
}
