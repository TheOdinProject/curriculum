class Node {
    constructor(data) {
        this.data = data;
        this.leftChild = null;
        this.rightChild = null;
    }

    isLeft() {
        return this.leftChild ? true : false;
    }

    isRight() {
        return this.rightChild ? true : false;
    }
}


class Tree {
    constructor() {
        this.root = null;
    }

    buildTree(array) {

        const set = new Set(array.sort());
        console.log("set: ", set, Array.isArray(set));
        let newArray = new Array(...set);
        console.log("newArray: ", newArray, Array.isArray(newArray));
        newArray.sort((a, b) => a - b);
        // newArray.sort();
        console.log("Sorted: ", newArray, newArray.length);

        this.root = this.buildTreeRecursive(newArray, 0, newArray.length - 1);
        console.log(this.root.isLeft());
        console.log(this.root.isRight());
        return this.root;

    }


    buildTreeRecursive(arr, start, end) {

        if (start > end) {
            return null;
        }

        let mid = Math.floor((start + end) / 2);
        // console.log(start, end, mid);
        let root = new Node(arr[mid]);

        root.leftChild = this.buildTreeRecursive(arr, start, mid - 1);

        root.rightChild = this.buildTreeRecursive(arr, mid + 1, end);

        return root;
    }

    height(data) {
        let node = this.findNode(data);

        if (node !== null) {
            return this.getHeight(node);
        }
        else
            console.log("Can not find the height of the node as the node is not present on the tree.");
    }

    getHeight(node) {
        if (node == null)
            return 0;
        return Math.max(this.getHeight(node.leftChild), this.getHeight(node.rightChild) + 1);
    }

    isBalanced(root) {

        if (root == null)
            return true;

        let leftSubtreeHeight = this.getHeight(root.leftChild);
        let rightSubtreeHeight = this.getHeight(root.rightChild);

        if (Math.abs(leftSubtreeHeight - rightSubtreeHeight) <= 1
            && this.isBalanced(root.leftChild) == true
            && this.isBalanced(root.rightChild) == true)
            return true;

        return false;
    }

    rebalance() {
        const nodes = [];

        this.inOrder(node => nodes.push(node.data));
        console.log("nodes: ", nodes);
        this.root = this.buildTree(nodes);
    }

    insert(data) {

        let currentNode = this.root;
        let newNode = new Node(data);

        let inserted = false;

        console.log("currentNode: ", currentNode.data);

        while (inserted != true) {
            if (currentNode.data >= newNode.data) {
                // inserted = true;
                // console.log("1");
                if (!currentNode.leftChild) {
                    currentNode.leftChild = newNode;
                    inserted = 1;
                }
                else {
                    currentNode = currentNode.leftChild;
                }
            }
            else {
                if (!currentNode.rightChild) {
                    currentNode.rightChild = newNode;
                    inserted = 1;
                }
                else {
                    currentNode = currentNode.rightChild;
                }
            }
        }
        return inserted;
    }

    delete(data) {

        if (this.find(data)) {

            let currentNode = this.root;
            let isDeleted = false;
            let nodeToBeDeleted = null;


            if (this.root.data === data) {
                nodeToBeDeleted = this.root;
            }
            else {
                while (currentNode.leftChild.data !== data && currentNode.rightChild.data !== data && currentNode != null) {
                    if (currentNode.data > data)
                        currentNode = currentNode.leftChild;
                    else
                        currentNode = currentNode.rightChild;
                }


                if (currentNode.leftChild.data === data) {
                    nodeToBeDeleted = currentNode.leftChild;
                    if (currentNode.leftChild.leftChild === null && currentNode.leftChild.rightChild === null) {
                        currentNode.leftChild = null;
                        isDeleted = true;
                        console.log("deleted");
                    }
                }

                if (currentNode.rightChild.data === data) {
                    nodeToBeDeleted = currentNode.rightChild;
                    if (currentNode.rightChild.leftChild === null && currentNode.rightChild.rightChild === null) {
                        currentNode.rightChild = null;
                        isDeleted = true;
                        console.log("deleted");
                    }
                }
            }

            if (!isDeleted) {

                let tNode = nodeToBeDeleted;

                if (tNode.rightChild.leftChild == null) {
                    console.log("deleted");
                    nodeToBeDeleted.data = tNode.rightChild.data;
                    tNode.rightChild = tNode.rightChild.rightChild;
                }
                else {
                    tNode = tNode.rightChild;
                    console.log(tNode.data);
                    while (tNode.leftChild.leftChild) {
                        console.log(tNode.data);
                        tNode = tNode.leftChild;
                    }
                    nodeToBeDeleted.data = tNode.leftChild.data;
                    tNode.leftChild = tNode.leftChild.rightChild;
                    console.log("deleted");
                }
            }

        }
        else {
            console.log("Can not delete the node as it is not present on the tree");
        }

    }

    find(data) {
        let res = this.findRecursive(this.root, data);
        console.log("res: ", res);
        return res;
    }

    findRecursive(node = this.root, data) {
        let res = false;
        if (node == null) {
            return false;
        }

        if (node.data === data) {
            return true;
        }
        else {
            if (!node.leftChild && !node.rightChild)
                return false;
            if (node.data > data) {
                res = this.findRecursive(node.leftChild, data);
            }
            else {
                res = this.findRecursive(node.rightChild, data);
            }
        }
        return res;
    }


    findNode(data) {
        let node = this.findNodeRecursive(this.root, data);
        return node;
    }

    findNodeRecursive(node = this.root, data) {
        // console.log(node);
        let resNode = null;
        if (node == null) {
            return null;
        }
        if (node.data === data) {
            resNode = node
        }
        else {
            if (!node.leftChild && !node.rightChild) {
                return null;
            }
            if (node.data > data) {
                resNode = this.findNodeRecursive(node.leftChild, data);
            }
            else {
                resNode = this.findNodeRecursive(node.rightChild, data);
            }
        }
        // console.log(resNode);
        return resNode;
    }


    levelOrder(callback) {

        if (typeof (callback) !== 'function') {
            console.log("inside error");
            throw new Error("Callback function is required");
        }

        if (!this.root) {
            console.log("inside !this.root");
            return;
        }


        const queue = [this.root];
        let node;

        queue.push[this.root];

        while (queue.length > 0) {
            node = queue.shift();

            callback(node);

            if (node.leftChild)
                queue.push(node.leftChild);

            if (node.rightChild)
                queue.push(node.rightChild);
        }
    }


    inOrder(callback, node = this.root) {
        if (typeof (callback) !== 'function') {
            throw new Error("Callback function is required");
        }

        if (!node) {
            return;
        }

        this.inOrder(callback, node.leftChild);
        callback(node);
        this.inOrder(callback, node.rightChild);
    }

    preOrder(callback, node = this.root) {

        if (typeof (callback) !== 'function') {
            throw new Error("Callback function is required");
        }

        if (!node) {
            return;
        }

        callback(node);
        this.preOrder(callback, node.leftChild);
        this.preOrder(callback, node.rightChild);
    }

    postOrder(callback, node = this.root) {

        if (typeof (callback) !== 'function') {
            throw new Error("Callback function is required");
        }

        if (!node) {
            return;
        }

        this.postOrder(callback, node.leftChild);
        this.postOrder(callback, node.rightChild);
        callback(node);
    }


    depth(data) {
        let res = this.depthRecursive(data, this.root, -1);
        return res;
    }

    depthRecursive(data, node, depth) {
        let nodeDepth = -1;

        if (node === null)
            return -1;

        if (node.data === data) {

            depth++;
            return depth;
        }
        else {
            if (node.data > data) {
                depth++;
                nodeDepth = this.depthRecursive(data, node.leftChild, depth);
            }
            else {
                depth++;
                nodeDepth = this.depthRecursive(data, node.rightChild, depth);
            }
        }

        return nodeDepth;
    }

    prettyPrint(node = this.root, prefix = "", isLeft = true) {
        if (node === null) {
            return;
        }
        if (node.rightChild !== null) {
            this.prettyPrint(node.rightChild, `${prefix}${isLeft ? "│   " : "    "}`, false);
        }
        console.log(`${prefix}${isLeft ? "└── " : "┌── "}${node.data}`);
        if (node.leftChild !== null) {
            this.prettyPrint(node.leftChild, `${prefix}${isLeft ? "    " : "│   "}`, true);
        }
    };
}

export { Tree }