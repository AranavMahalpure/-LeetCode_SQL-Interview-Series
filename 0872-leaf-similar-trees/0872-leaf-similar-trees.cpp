/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
        void Traverse(TreeNode* root,vector<int> &v){
        if(root == NULL){
            return;
        }
        if(!root->left && !root->right){
            v.push_back(root->val);
        }
        Traverse(root->left,v);
        
        Traverse(root->right,v);
    }
    bool leafSimilar(TreeNode* root1, TreeNode* root2) {
        vector<int> r1,r2;
        Traverse(root1,r1);
        Traverse(root2,r2);
        return r1 == r2;
        
    }
};