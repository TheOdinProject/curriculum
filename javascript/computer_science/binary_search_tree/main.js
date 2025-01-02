import { Tree } from "./tree.js";

const randomArray = Array.from({ length: 15 }, () => Math.floor(Math.random() * 100));
// Array.from({ length: 15 }, Math.floor(Math.random() * 100));

const binaryTree = new Tree();

binaryTree.buildTree(randomArray);
binaryTree.prettyPrint();

if (!binaryTree.isBalanced) {
    binaryTree.rebalance();
    console.log("Tree after rebalance: ");
    binaryTree.prettyPrint();
}
// console.log(binaryTree.insert(9));
// console.log(binaryTree.insert(101));

// binaryTree.prettyPrint();

// binaryTree.delete(1);
// console.log(binaryTree.insert(1));
// binaryTree.prettyPrint();
// binaryTree.delete(8);
// binaryTree.delete(2);
// binaryTree.prettyPrint();

// console.log("1: ", binaryTree.find(25));
// console.log("2: ", binaryTree.findRecursive(25));

console.log("Lever-order(BFS): ");
binaryTree.levelOrder(node => console.log(node.data));
console.log("In-order: ");
binaryTree.inOrder(node => console.log(node.data));
console.log("Pre-order: ");
binaryTree.preOrder(node => console.log(node.data));
console.log("Post-order: ");
binaryTree.postOrder(node => console.log(node.data));

console.log("depth: ", binaryTree.depth(15));

console.log("Height: ", binaryTree.height(15));

console.log(binaryTree.insert(16));
console.log(binaryTree.insert(17));
console.log(binaryTree.insert(18));

binaryTree.prettyPrint();
console.log("is Balanced: ", binaryTree.isBalanced(binaryTree.root));

// if (binaryTree.isBalanced() === false) {
binaryTree.rebalance();
console.log("Tree after reablanced:");
binaryTree.prettyPrint();
// }