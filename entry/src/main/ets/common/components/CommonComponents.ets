@Component
export struct Header{
  private tittle:ResourceStr
  build(){
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(30)
      Text(this.tittle)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Blank()// 占位使用，撑开
      Image($r('app.media.ic_public_refresh'))
        .width(30)
    }
    .width('100%')
    .height(30)
  }
}