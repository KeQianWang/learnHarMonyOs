import RouterInfo from '../viewmodel/RouterInfo'
import RouterItem from '../views/RouterItem'

const routers:RouterInfo[] = [
  new RouterInfo('pages/ImagePage', '图片查看'),
  new RouterInfo('pages/ItemPage', '商品列表'),
  new RouterInfo('pages/StatePage', 'Jack和他的女友'),
  new RouterInfo('pages/PropPage', '任务列表'),
]

@Entry
@Component
struct Index {
  @State message: string = '页面列表'
  // @State showPanel: boolean = false
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
      // Image($r('app.media.ic_public_settings'))
      //   .width(30)
      //   .onClick(() => {
      //     animateTo({ duration: 500, curve: Curve.EaseOut }, () => this.showPanel = !this.showPanel)
      //   })
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
  }
}

