library(compiler)
loadcmp("POW.Rc")

#pow(a,b,c,d) 参数说明
#a，要生成的图片数量
#b，相关度
#c，股票代码
#d，样本数据路径,样本数据格式为tab分割的文本文件，收盘价格列名请改为 Close。

#example
pow(3,0.5,601718,"./ExpData.TXT")
