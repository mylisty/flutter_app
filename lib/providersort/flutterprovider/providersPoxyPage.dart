/// @ProjectName: flutter_app
/// @Description: 
/// @Author: maoShengTao
/// @CreateDate: 2021/5/18 3:36 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/18 3:36 下午
///  @UpdateRemark: 更新说明
///]

/// 有一种新的代理provider可供使用，ProxyProvider能够将不同provider中的多个值整合成一个对象，并将其发送给外层provider，当所依赖的多个provider中的任意一个发生变化时，这个新的对象都会更新。


/*
/// provider 想要传递到下一个页面使用 必须在MyProviderApp 初始化页面中添加Model；单个页面可以参考ProviderTestPage3页面，并且单页面内无法修改全局的model
Provider 最基础的provider,它会获取一个值并将它暴露出来
ListenableProvider 用来暴露可监听的对象，该provider将会监听对象的改变以便及时更新组件状态
ChangeNotifierProvider ListerableProvider依托于ChangeNotifier的一个实现，它将会在需要的时候自动调用ChangeNotifier.dispose方法
ValueListenableProvider 监听一个可被监听的值，并且只暴露ValueListenable.value方法
StreamProvider 监听一个流，并且暴露出其最近发送的值
FutureProvider 接受一个Future作为参数，在这个Future完成的时候更新依赖



使用ChangeNotifierProvider.value来提供一个当前已存在的 ChangeNotifier
https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md 细读
*/

