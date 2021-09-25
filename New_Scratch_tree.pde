Tree tree;
ArrayList<Tree> trees = new ArrayList<Tree>();
// ##############################################################
Tree construcIf(){
  Tree treeif = new Tree("if");
  return treeif;
}
Tree construcFor(int n, Tree child){
  Tree treefor = new Tree("for");
  for(int i=0; i<n; i++){
    treefor.addchild(child);
  }
  return treefor;
}
Tree construcWalk(String way){
  Tree treewalk = new Tree(way);
  return treewalk;
}
Tree construcTurn(String side){
  Tree treeturn = new Tree(side);
  return treeturn;
}
// ##############################################################
Tree combineTree(Tree root,Tree child){
  Tree newtree = root;
  newtree.addchild(child);
  return newtree;
}
// ##############################################################
void setup(){
    size(640, 640);
    background(255);
    
    tree = new Tree("null");
    
    Tree testtree;
    Tree childtesttree = construcIf();
    childtesttree.addIfstatement(construcWalk("down"),"false");
    childtesttree.addElsestatement(construcWalk("left"));
    childtesttree.addchild(construcWalk("right"));
    testtree = construcFor(4,childtesttree);
    testtree.addchild(childtesttree);
    trees.add(testtree);
    
    tree.addchild(trees.get(0));
    ArrayList<String> commands = tree.getCommandlist(tree.getRoot());
    for(int i=0;i<commands.size();i++){
      println(commands.get(i));
    }
}
void draw(){
  tree.draw(width, height,tree.getRoot());
}
