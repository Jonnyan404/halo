> 这里是第三方镜像,补充一下官方未上线的arm版本.
---
> 官方项目地址:<https://github.com/halo-dev/halo>

> 官方安装教程:https://halo.run/archives/install-quick-start.html

---

- Telegram群: https://t.me/HaloBlog

### 任何使用问题  telegram 群 @jonnyan

## 这里支持 arm64/amd64 双版本.

`docker run  -it -d --name halo -p 8090:8090  -v /opt/.halo:/home/halo/.halo jonnyan404/halo`

## FAQ
1. 由于本镜像默认是低权限用户运行,如果挂载本地目录有问题.
- 执行`chmod 777 /opt/.halo` 或者 保证你挂载的目录有读写权限
