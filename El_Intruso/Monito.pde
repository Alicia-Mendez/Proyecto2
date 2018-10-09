class Monito {

  // We need to keep track of a Body and a radius
  Body body;

  Monito(float x, float y) {
    // This function puts the particle in the Box2d world
    makeBody(x, y);
  }

  void display() {

    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);

    pushMatrix();
    translate(pos.x, pos.y);
    imageMode(CENTER);
    image(monita, 0, 0);
    image(monito, 0, 0);
    popMatrix();
    println(pos.y);
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(15);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    //fd.density = 0;
    //fd.friction = 0.00;
    fd.restitution = 0.2;

    // Attach fixture to body
    body.createFixture(fd);

    //body.setAngularVelocity(random(-10,10));
  }

  void subir(float f_) {
    float fT = box2d.scalarPixelsToWorld(f_);
    body.applyLinearImpulse(new Vec2(0, fT), new Vec2(body.getWorldCenter()), true);
  }

  void mover(float x_) {
    float mT = box2d.scalarPixelsToWorld(x_);
    body.applyLinearImpulse(new Vec2(mT, 0), new Vec2(body.getWorldCenter()), true);
    //body.setLinearVelocity(new Vec2(mT,0));
  }
}
