import RouterInfo from '../viewmodel/RouterInfo'
import RouterItem from '../views/RouterItem'

const routers:RouterInfo[] = [
  new RouterInfo('pages/ImagePage', '图片查看'),
  new RouterInfo('pages/ItemPage', '商品列表'),
  new RouterInfo('pages/StatePage', 'Jack和他的女友'),
  new RouterInfo('pages/PropPage', '任务列表'),
  new RouterInfo('pages/AnimationPage', '小鱼动画案例按钮版'),
  new RouterInfo('pages/AnimationPage2', '小鱼动画案例摇杆版'),
  new RouterInfo('pages/LifeCirclePage', '生命周期案例1'),
  new RouterInfo('pages/TestPage1', '生命周期案例2'),
  new RouterInfo('pages/DocumentListPage', 'UIAbility启动模式案例'),
]

@Entry
@Component
struct Index {
  @State message: string = '页面列表'
  @Provide fontSize: number = 16
  build() {
      Column(){
        //顶部标题
        this.Title()

        //导航列表
        this.RouterList()
      }
    .width('100%')
    .height('100%')
  }

  @Builder Title(){
    Row() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .height(80)
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
  }

  @Builder RouterList(){
    List({space:15}){
      ForEach(
        routers,
        (router,index)=>{
          ListItem(){
            RouterItem({ r: router, i: index + 1 })
          }
        }
      )
    }
    .alignListItem(ListItemAlign.Center)
  }
}

