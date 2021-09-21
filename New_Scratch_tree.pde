Tree tree;

void construcIfinIf(){
  tree = new Tree("if");
  Tree if_in_if = new Tree("if");
  tree.changeFirstChild(if_in_if.getTree());
}
void construcFor(){
  tree = new Tree("for");
}
void setup(){
    size(640, 640);
    background(255);
    
    //tree = new Tree("if");
    construcIfinIf();
    //construcFor();
}
void draw(){
  tree.draw(width, height,tree.getTree());
}
