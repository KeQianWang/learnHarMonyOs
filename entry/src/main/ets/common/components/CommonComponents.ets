import router from '@ohos.router'
@Component
export struct Header{
  private title:ResourceStr
  @State params :any = router.getParams()

  build(){
    Row({space:5}){
      Image($r('app.media.ic_public_back'))
        .width(30)
        .onClick(()=>{
          // 返回前的警告
          //  router.showAlertBeforeBackPage({
          //    message: '支付还未完成，确定要返回吗？'
          //  })

          // 返回上一页
          router.back()
        })
      if(this.params && this.title){
        Text(this.params.id + '.' + this.title)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
      }
      Blank()// 占位使用，撑开
      Image($r('app.media.ic_public_refresh'))
        .width(30)
    }
    .width('100%')
    .height(30)
  }
}