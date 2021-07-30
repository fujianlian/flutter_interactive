# flutter_interactive

Flutter 与 Native 端通信Demo

## 通信方式

有如下3个方法：

- **MethodChannel：** Flutter 与 Native 端相互调用，调用后可以返回结果，可以 Native 端主动调用，也可以Flutter主动调用，属于双向通信。此方式为最常用的方式， Native 端调用需要在主线程中执行。
- **BasicMessageChannel：** 用于使用指定的编解码器对消息进行编码和解码，属于双向通信，可以 Native 端主动调用，也可以Flutter主动调用。
- **EventChannel：** 用于数据流（event streams）的通信， Native 端主动发送数据给 Flutter，通常用于状态的监听，比如网络变化、传感器数据等

