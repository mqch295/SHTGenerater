# SHTGenerater

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://www.opensource.org/licenses/MIT)

SHTGenerater 是十荟团系列项目生成子模块基础目录结构和基础代码文件的命令行工具

## 安装

### 下载

```sh
git clone git@gitlaball.nicetuan.net:nicetuan/app/ios/shtgenerater.git
```
或

```sh
git clone http://gitlaball.nicetuan.net/nicetuan/app/ios/shtgenerater.git
```

### 自动安装
#### bash
```sh
cd SHTGenerater
./install_bash.sh
```

#### zsh
```sh
cd SHTGenerater
./install_zshrc.sh
```

### 手动安装
#### bash
```sh
cd SHTGenerater
swift build -c release
echo "export PATH=\"\$PATH:$(pwd)/.build/release\"" >> ~/.bash_profile
source ~/.bash_profile
```

#### zsh
```sh
cd SHTGenerater
swift build -c release
echo "export PATH=\"\$PATH:$(pwd)/.build/release\"" >> ~/.zshrc
source ~/.zshrc
```

## 使用

### Generators

在当前目录（推荐项目代码目录）执行声明

```sh
# 创建业务模块
SHTGenerater generate Module Name 

选项
  --force, -f
  强制重写已存在的文件
  --iglistkit, -ig
  使用基于IGListKit生成的模板代码，VC，Cell 及 Model 和 ViewModel 均会依赖 IGListKit
```
也可以写成  `SHTGenerater g`  等同于 `SHTGenerater generate`

## 环境要求

* Xcode 10
* Swift 5

## Contact

* Mqch295 - 孟庆成
* Email: mqch295@gmail.com

## License

SHTGenerater is released under the [MIT License](http://www.opensource.org/licenses/MIT).
