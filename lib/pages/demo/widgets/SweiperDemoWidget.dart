import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BannerDemoWidget();
  }
}

class _BannerDemoWidget extends State<BannerDemoWidget> {
  final images = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601010810821&di=47940e8fead9ba33061e61ca0abf7ea4&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D3723769414%2C4193405526%26fm%3D214%26gp%3D0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2350817201,1137116540&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1534594297,2030168992&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2196884168,2008099733&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601010923691&di=005d3164b972df513e4d903c5f02fa6e&imgtype=0&src=http%3A%2F%2Fwww.szzhixinghb.com%2Fdata%2Fimages%2Fslide%2F20180723102658_539.jpg'
  ];

  int _currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          height: 180,
          child: Swiper(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                child: Image.network(images[index], fit: BoxFit.cover),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
              );
            },
            pagination: SwiperPagination(),
            //显示指示器
            autoplay: true,
            viewportFraction: 0.8,
            //当前页的占比，如果小于1，那么剩下的部分将有左右两边填充。
            scale: 0.9, //每个Banner的缩放比例
            onTap: (i) => setState(()=> _currentIndex = i),
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: Text(_currentIndex >= 0 ? '您点击了第$_currentIndex个条目' : ''),
        )
      ],
    );
  }
}
