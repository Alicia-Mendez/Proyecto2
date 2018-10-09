class Pantalla {
  int n;
  Body body;
  boolean delete = false;

  void menu() {
    imageMode(CENTER);
    image(fondo1, width/2, height/2);
  }

  void instrucciones() {
    imageMode(CENTER);
    image(fondo5, width/2, height/2);
  }

  void juego() {
    imageMode(CENTER);
    //background(255);
    image(fondo2, width/2, height/2);
    negro.display();
    image(fondo4, width/2, height/2);
    image(fondo3, width/2, height/2);
  }

  void laberinto() {
    plataformas = new ArrayList();
    //ABAJO
    plataformas.add(new Plataforma(width/2, height-5, width, 8, 0));
    //ARRIBA
    plataformas.add(new Plataforma(206, 4, 412, 8, 0));
    plataformas.add(new Plataforma(795, 4, 610, 8, 0));
    //DERECHA
    plataformas.add(new Plataforma(width-5, height/2, 8, height, 0));
    //IZQUIERDA
    plataformas.add(new Plataforma(5, height/2, 8, height, 0));


    plataformas.add(new Plataforma(64, 228, 8, 440, 0));
    plataformas.add(new Plataforma(150, 70, 8, 124, 0));
    plataformas.add(new Plataforma(150, 198, 8, 44, 0));
    plataformas.add(new Plataforma(150, 426, 8, 44, 0));
    plataformas.add(new Plataforma(236, 52, 8, 88, 0));
    plataformas.add(new Plataforma(236, 198, 8, 44, 0));
    plataformas.add(new Plataforma(236, 330, 8, 132, 0));
    plataformas.add(new Plataforma(322, 140, 8, 264, 0));
    plataformas.add(new Plataforma(322, 374, 8, 44, 0));
    plataformas.add(new Plataforma(408, 110, 8, 44, 0));
    plataformas.add(new Plataforma(408, 198, 8, 44, 0));
    plataformas.add(new Plataforma(408, 356, 8, 184, 0));
    plataformas.add(new Plataforma(494, 48, 8, 96, 0));
    plataformas.add(new Plataforma(494, 206, 8, 132, 0));
    plataformas.add(new Plataforma(494, 400, 8, 96, 0));
    plataformas.add(new Plataforma(580, 48, 8, 96, 0));
    plataformas.add(new Plataforma(580, 294, 8, 308, 0));
    plataformas.add(new Plataforma(666, 48, 8, 96, 0));
    plataformas.add(new Plataforma(666, 162, 8, 44, 0));
    plataformas.add(new Plataforma(666, 382, 8, 132, 0));
    plataformas.add(new Plataforma(752, 22, 8, 44, 0));
    plataformas.add(new Plataforma(752, 136, 8, 96, 0));
    plataformas.add(new Plataforma(752, 356, 8, 80, 0));
    plataformas.add(new Plataforma(838, 110, 8, 44, 0));
    plataformas.add(new Plataforma(838, 268, 8, 184, 0));
    plataformas.add(new Plataforma(838, 426, 8, 44, 0));
    plataformas.add(new Plataforma(924, 224, 8, 96, 0));
    plataformas.add(new Plataforma(924, 400, 8, 96, 0));
    plataformas.add(new Plataforma(1010, 268, 8, 360, 0));

    plataformas.add(new Plataforma(1053, 92, 94, 8, 0));
    plataformas.add(new Plataforma(1028, 180, 44, 8, 0));
    plataformas.add(new Plataforma(1078, 268, 44, 8, 0));
    plataformas.add(new Plataforma(985, 356, 130, 8, 0));
    plataformas.add(new Plataforma(967, 268, 94, 8, 0));
    plataformas.add(new Plataforma(881, 180, 166, 8, 0));
    plataformas.add(new Plataforma(820, 92, 216, 8, 0));
    plataformas.add(new Plataforma(838, 268, 80, 8, 0));
    plataformas.add(new Plataforma(770, 356, 216, 8, 0));
    plataformas.add(new Plataforma(906, 444, 44, 8, 0));
    plataformas.add(new Plataforma(734, 444, 216, 8, 0));
    plataformas.add(new Plataforma(666, 268, 180, 8, 0));
    plataformas.add(new Plataforma(469, 92, 130, 8, 0));
    plataformas.add(new Plataforma(390, 444, 388, 8, 0));
    plataformas.add(new Plataforma(303, 268, 388, 8, 0));
    plataformas.add(new Plataforma(451, 180, 94, 8, 0));
    plataformas.add(new Plataforma(340, 92, 44, 8, 0));
    plataformas.add(new Plataforma(365, 356, 94, 8, 0));
    plataformas.add(new Plataforma(168, 92, 44, 8, 0));
    plataformas.add(new Plataforma(150, 180, 180, 8, 0));
    plataformas.add(new Plataforma(125, 356, 130, 8, 0));
    plataformas.add(new Plataforma(107, 444, 94, 8, 0));
    plataformas.add(new Plataforma(580, 356, 80, 8, 0));
    plataformas.add(new Plataforma(666, 180, 180, 8, 0));
    
      for (int i = 0; i < plataformas.size(); i++) {
      Plataforma wall = (Plataforma) plataformas.get(i);
      wall.display();
    }
  }

  void display() {
    switch(this.n) {
    case 0:
      menu();
      break;
    case 1:
      instrucciones();
      break;
    case 2:
      juego();
      Vec2 pos = box2d.getBodyPixelCoord(negro.body);
      if (pos.y < 0) {
        //killBody();
        n= 0;
        pos.x = a;
        pos.y = b;
      }
      break;
    }
  }


  void teclado() {
    if (n == 0 && keyCode == ENTER) {
      n = 1;
    } 
    if ( n == 1 && key == ' ') {
      n = 2;
    }
    if (n == 2 && keyCode == ENTER || key == ' ' ) {
      n = 2;
    }
  }

  //ELIMINAR A MONITO
  /*
  boolean done() {
   return false;
   }
   
   // This function removes the particle from the box2d world
   void killBody() {
   box2d.destroyBody(negro.body);
   }
   
   void delete() {
   delete = true;
   }
   */
}
