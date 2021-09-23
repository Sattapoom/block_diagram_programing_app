Tree tree;
// ##############################################################
Tree construcIf(){
  Tree treeif = new Tree("if");
  return treeif;
}
Tree construcFor(int n, Tree child){
  Tree treefor = new Tree("for");
  for(int i=0; i<n; i++){
    treefor.addchild(child.getRoot());
  }
  return treefor;
}
Tree construcWalk(){
  Tree treewalk = new Tree("walk");
  return treewalk;
}

// ##############################################################
void setup(){
    size(640, 640);
    background(255);
    
    //tree = construcIf();
    tree = construcFor(3,construcFor(2,construcWalk()));
}
void draw(){
  tree.draw(width, height,tree.getRoot());
}
