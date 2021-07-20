import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/18 3:16 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/18 3:16 下午
///  @UpdateRemark: 更新说明

class ProvidersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProvidersPage();
  }
}

class ProviderBean {
  String name;

  ProviderBean.name(this.name);
}

class _ProvidersPage extends State<ProvidersPage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ProviderBean.name("稍等"),
      child: SecondChild(),
    );
  }

  doSomeHttpRequest() {}
}

class TestChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderBean>(context);
    return Center(
      child: Text("data ${model.name}"),
    );
  }
}

class SecondChild extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondChildState();
  }
}

class _SecondChildState extends State<SecondChild> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderBean>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return new SecondChild3();
            }));
          },
          child: Text("data"),
        ),
      ),
    );
  }
}

class SecondChild3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondChildState3();
  }
}

class _SecondChildState3 extends State<SecondChild3> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderBean>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
        child: Text("data ${model.name}"),
      ),
    );
  }
}
