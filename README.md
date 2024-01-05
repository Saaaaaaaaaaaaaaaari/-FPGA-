# -FPGA-
利用FPGA實踐的8X8點矩陣小遊戲

## 主要控制和功能
![407183421_960376145655272_7229158405226403170_n](https://github.com/Saaaaaaaaaaaaaaaari/-FPGA-/assets/155716025/2137eb35-5ecc-433e-bea2-191ecb23baf7)
使用4BITS SW來控制藍點(玩家)的上下左右。
![410499119_929442571377973_4448902799018553173_n](https://github.com/Saaaaaaaaaaaaaaaari/-FPGA-/assets/155716025/a14c2c80-803a-47d7-9b61-114e0cfe4fcb)
紅色第四個的8 DIPSW是用來控制藍點旁邊的燈的變化的，當它呈現高位時，藍點周圍的綠色光點將隨著<亮變暗，暗變亮>的規律變化。
![414669531_749856757163226_5129052288422733110_n](https://github.com/Saaaaaaaaaaaaaaaari/-FPGA-/assets/155716025/b8fd8893-818d-418d-acc9-2ebbc42f8c64)
![407107806_717861813776209_5080694879179522951_n](https://github.com/Saaaaaaaaaaaaaaaari/-FPGA-/assets/155716025/97911dc6-97c2-43f0-8931-38a0bd54915d)
每當我們執行一次變化時，就會記錄下來，請以最低的步數把整個8X8點矩陣都填滿吧!
再填滿之後，剛剛4BITS SW上面的BEEP就會為你發出喝采，慶祝你的大勝利。

## PIN腳位
<img width="481" alt="螢幕擷取畫面 2024-01-05 155000" src="https://github.com/Saaaaaaaaaaaaaaaari/-FPGA-/assets/155716025/33d2c100-8fff-4ace-8d17-6daa7d8a8e7f">
<img width="484" alt="螢幕擷取畫面 2024-01-05 155046" src="https://github.com/Saaaaaaaaaaaaaaaari/-FPGA-/assets/155716025/903508b1-6a50-494f-aeaa-64bf819f432a">
<img width="482" alt="螢幕擷取畫面 2024-01-05 155030" src="https://github.com/Saaaaaaaaaaaaaaaari/-FPGA-/assets/155716025/c75564a5-9e95-4f78-be0b-312e2ad855ab">

## 功能影片

https://youtu.be/zih0bMLZptQ?feature=shared



