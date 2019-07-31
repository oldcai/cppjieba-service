## cppjieba-service


```
docker pull oldcai/cppjieba-service:latest
```

## 用法示例：

```
docker run -d -p 8008:80 oldcai/cppjieba-service:latest
```

```
curl 'localhost:8008/?key=工信处女干事每月经过下属科室都要亲口交代24口交换机等技术性器件的安装工作'

Output:
["工信处", "女干事", "每月", "经过", "下属", "科室", "都", "要", "亲口", "交代", "2", "4", "口", "交换机", "等", "技术性", "器件", "的", "安装", "工作"]
```

有问题或者建议可以到[老蔡博客](https://www.oldcai.com/server/cppjieba-service/)留言
