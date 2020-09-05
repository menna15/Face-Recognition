# Face-Recognition 
###  Using PCA technique
```diff 
+ KNN classify
```
____

| **Steps**        | 
| ------------- |
| Read all trianing images      | 
| flatten image matrix to vector   |
| find average face vector |
| subtract every average face vector from every image vector |
| stack all in matrix forming **A** |
| calculate covariance matrix |
| find eigenvectors and eigenvalues of covariance matrix |
| choose the largest eigenvalue|
| use K-Nearest Neighbor classify function |
