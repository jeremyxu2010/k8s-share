#!/bin/bash

# 虚拟机的IP及root密码
MASTER_IP=10.211.55.7
ROOT_PASSWD=123456

# 下载安装介质
wget -c https://sealyun.oss-cn-beijing.aliyuncs.com/latest/sealos && chmod +x sealos && mv sealos /usr/bin
wget -c -O /root/kube1.18.0.tar.gz https://sealyun.oss-cn-beijing.aliyuncs.com/d551b0b9e67e0416d0f9dce870a16665-1.18.0/kube1.18.0.tar.gz

# 初始化k8s集群
sealos init --master ${MASTER_IP} --user root --passwd ${ROOT_PASSWD} --version v1.18.0 --pkg-url /root/kube1.18.0.tar.gz

# 去除master节点污点，使master节点可以运行业务Pod
kubectl taint nodes --all node-role.kubernetes.io/master-

# 开启kubectl命令补全
source <(kubectl completion bash)
echo 'source <(kubectl completion bash)' >> ~/.bashrc