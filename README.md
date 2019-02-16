
高维数据可视化 largeVis 安装（Linux）

# 使用方法：
```shell
# 降维
docker run --rm -it -v $PWD:/mnt gswyhq/largevis /root/LargeVis/Linux/LargeVis -input /mnt/mnist_vec784D.txt -output /mnt/mnist_vec2D.txt -threads 16

# 可视化
python3 plot.py -input mnist_vec2D.txt -label mnist_label.txt -output mnist_vec2D_plot
```

[mnist_vec784D.txt](https://github.com/lferry007/LargeVis/blob/master/Examples/MNIST/mnist_vec784D.txt.zip)

[mnist_label.txt](https://github.com/lferry007/LargeVis/blob/master/Examples/MNIST/mnist_vec784D.txt.zip)

[plot.py](https://github.com/lferry007/LargeVis/blob/master/plot.py)

# 参考资料
[LargeVis可视化技术学习](https://blog.csdn.net/sparkexpert/article/details/70702344)

[从SNE到t-SNE再到LargeVis](http://bindog.github.io/blog/2016/06/04/from-sne-to-tsne-to-largevis/)




