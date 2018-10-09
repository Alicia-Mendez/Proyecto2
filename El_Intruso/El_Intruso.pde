import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;
Pantalla pantalla;
Monito negro;

PImage fondo1;
PImage fondo2;
PImage fondo3;
PImage fondo4;
PImage fondo5;
PImage monito;
PImage monita;

float x_ = 0;
float a= 40;
float b= 10;
// A list we'll use to track fixed objects
ArrayList plataformas;

void setup() {
  size(1100, 500);

  fondo1 = loadImage("fondo1.jpg");
  fondo2 = loadImage("fondo2.jpg");
  fondo3 = loadImage("fondo3.png");
  fondo4 = loadImage("fondo4.png");
  fondo5 = loadImage("fondo5.jpg");
  monito = loadImage("monito.png");
  monita = loadImage("monita.png");

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  // Turn on collision listening!
  box2d.listenForCollisions();

  // Add a bunch of fixed boundaries

  pantalla = new Pantalla();
  pantalla.laberinto();
  negro = new Monito(a, b);
}

void draw() {
   
  pantalla.display();

  box2d.setGravity(0, -100);

  // We must always step through time!
  box2d.step();


  if (keyPressed) {
    if (keyCode == UP) {
      negro.subir(250);
    }
    if (keyCode == LEFT) {
      negro.mover(-30);
    }
    if (keyCode == RIGHT) {
      negro.mover(30);
    }
  }
}

void keyPressed() {
  pantalla.teclado();
}
