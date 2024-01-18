import { Header } from '../common/components/CommonComponents'
class Item{
  name:string
  image:ResourceStr
  price:number
  discount:number

  constructor(name: string, image: ResourceStr, price: number,discount:number=0) {
    this.name=name
    this.image=image
    this.price=price
    this.discount=discount
  }
}


// 全局自定义构造函数
@Builder function ItemCard(item:Item){
  Row({space:10}){
    Image(item.image)
      .width(100)
      .interpolation(ImageInterpolation.High)

    Column({space:4}){
      if(item.discount){
        Text(item.name)
          .fontSize(20)
          .fontWeight(18)

        Text('原价：'+item.price)
          .fontColor('#ff648cc1')
          .fontSize(14)
          .decoration({type:TextDecorationType.LineThrough})

        Text('折扣价：'+(item.price-item.discount))
          .PriceText()

        Text('补贴'+item.discount)
          .PriceText()

      }else {
        Text(item.name)
          .fontSize(20)
          .fontWeight(18)

        Text('价钱'+item.price)
          .PriceText()
      }

    }
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
  .width('100%')
  .borderRadius(20)
  .height(180)
  .padding(10)
  .backgroundColor('#ffc8c3c3')
}

// 全局公共样式函数
@Styles function fillScreen(){
  .width('100%')
  .height('100%')
  .padding(20)

}
// 继承模式，只能写在全局
@Extend(Text) function PriceText(){
  .fontColor('#F36')
  .fontSize(18)
}


@Entry
@Component
struct Index {
  private items :Array<Item> = [
    new Item('钢铁侠11代',$r('app.media.iron'),999,666),
    new Item('钢铁侠12代',$r('app.media.iron'),999),
    new Item('钢铁侠13代',$r('app.media.iron'),999,555),
    new Item('钢铁侠14代',$r('app.media.iron'),999),
    new Item('钢铁侠15代',$r('app.media.iron'),999),
  ]

  build() {
    Column({space:20}){
      Header({tittle:'商品列表'})
      .margin(20)

      List({space:8}){
        ForEach(
          this.items,
          (item:Item)=>{
              ListItem(){
                this.ItemCard(item)
              }
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
    }
    .fillScreen()
  }

  // 局部自定义构造函数
  @Builder ItemCard(item:Item){
    Row({space:10}){
      Image(item.image)
        .width(100)
        .interpolation(ImageInterpolation.High)

      Column({space:4}){
        if(item.discount){
          Text(item.name)
            .fontSize(20)
            .fontWeight(18)

          Text('原价：'+item.price)
            .fontColor('#ff648cc1')
            .fontSize(14)
            .decoration({type:TextDecorationType.LineThrough})

          Text('折扣价：'+(item.price-item.discount))
            .PriceText()

          Text('补贴'+item.discount)
            .PriceText()

        }else {
          Text(item.name)
            .fontSize(20)
            .fontWeight(18)

          Text('价钱'+item.price)
            .PriceText()
        }

      }
      .height('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .borderRadius(20)
    .height(180)
    .padding(10)
    .backgroundColor('#ffc8c3c3')
  }
}