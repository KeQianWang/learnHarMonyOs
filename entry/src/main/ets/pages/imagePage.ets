@Entry
@Component
struct Index {
  @State imageWidth: number = 250

  build() {
    Column() {

      Row(){
        Image($r('app.media.iron'))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
      .height(400)
      .justifyContent(FlexAlign.Center)

      Row(){
        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Medium)

        TextInput({text:this.imageWidth.toFixed(0)})
          .type(InputType.Number)
          .width(200)
          .backgroundColor('#ffffff')
          .onChange(value=>{
            if(value){
              this.imageWidth = parseInt(value)
              console.log(value)
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({left:14,right:14})

      //分割线
      Divider()
        .width('91%')

      Row(){
        Button('放大')
          .width(80)
          .fontSize(20)
          .onClick(()=>{
            if(this.imageWidth<300){
              this.imageWidth+=30
            }
          })

        Button('缩小')
          .width(80)
          .fontSize(20)
          .onClick(()=>{
            if(this.imageWidth>=30){
              this.imageWidth-=30
            }
          })
      }
      .width('100%')
      .margin({top:30,bottom:30})
      .justifyContent(FlexAlign.SpaceEvenly)


      Slider({min:50,max:300,step:10,value:this.imageWidth})
        .width('100%')
        .blockColor('red')
        .trackThickness(7)
        .showTips(true)
        .onChange(value=>{
          this.imageWidth = value
        })
    }
    .width('100%')
    .height('100%')
  }
}