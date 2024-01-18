@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#36D')
          .onClick(()=>{
            this.message = 'Hello kq'
          })
        // Image('https://picx.zhimg.com/v2-57c0f69d0e8b626fc6b795879ec5ba23_r.webp?source=172ae18b&consumer=ZHI_MENG')
        //   .width(250)
        //   .height('50%')
        Image(
          $r('app.media.iron')
        )
          .width(250)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
    }
    .height('100%')
  }
}