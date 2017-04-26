library(compiler)
loadcmp("fn.Rc")

#读取样本数据
r1<-gData("D:/R/my/ExpData.TXT")$Close

#相关性分析，生成图片并返回文件路径。
getPngPath<-function(x,r,u){
  res<-run(r,u,100)
  return(saveres(res,"./img/601718",1000,400))
}

#done 引擎入口
doing<-function(n,a){# 需要生成的图片量,相关度。
  nu<-c(1:n)
  #多核计算
  numCores <- detectCores()
  cl <- makeCluster(numCores)
  #配置并发环境
  clusterExport(cl, "loadcmp") #导入loadcmp
  clusterEvalQ(cl,{loadcmp("fn.Rc")})#导入函数库
  
  results <- parSapply(cl, nu, getPngPath,r=r1,u=a)
  
  stopCluster(cl)
  print(results)
}
doing(3,0.3)
