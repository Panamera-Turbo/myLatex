function workchoose(IN)
work=[1.0500   -1.1670    1.0000    0.9110
      0.6280   -0.7430    1.0890    1.0000
      1.2170   -1.0610    1.1780    0.7330
      1.0000   -1.0610    0.9110    1.0890
      1.2500   -1.0610    0.7330    0.8220
      1.0500   -1.0610    0.8220    1.2670
      0.7830   -0.8490    1.2670    1.1780];
  %工作选取时每个影响因素对对应工作的占比评分，
  %行代表工作类型，列代表影响因素
  %类型分别为：推销；服务员；家教；外卖快递配送员；工地长工；短工，临时工；网络服务行业
  %影响因素分别为：工资；工作时长；环境；灵活性
  if IN(1,1)==1
      work(1,:)=zeros(1,4); work(4,:)=zeros(1,4);
      work(5,:)=zeros(1,4); work(6,:)=zeros(1,4);
  end
  if IN(1,1)==-1
      work(2,:)=zeros(1,4); work(3,:)=zeros(1,4);
      work(7,:)=zeros(1,4);
  end
  %选择题是否判断室内外工作，0==无所谓；1==只做室内；-1==只作室外
  if IN(2,1)==0
      work(5,:)=zeros(1,4); work(6,:)=zeros(1,4);
  end
  %判断是否做劳力工作，0==不做
   if IN(3,1)==0
      work(7,:)=zeros(1,4);
   end
   %判断是否有网络相关技能，0==没有
  IN(1,:)=[]; IN(1,:)=[]; IN(1,:)=[];
  %去掉调查表判断部分，对投权重部分进行计算
  OUT=work*IN;
  disp(OUT);
  %计算输出得分情况
  NAME={'salesman','waiter','private teacher','delivery man','worker Who do hard manual work','hourly worker','network service provider'};
  [R,Q]=max(OUT); OUT(Q,1)=-200;
  [R,W]=max(OUT); OUT(W,1)=-200;
  [R,E]=max(OUT);
  Result={'first choice',NAME{1,Q};'second choice',NAME{1,W};'third choice',NAME{1,E}};
  disp(Result);
  %查找并输出得分最大的三个工作
  OUT=cell2table(Result);
  writetable(OUT,'output.txt');
  type output.txt;
  %将输出情况输出到文本文档中
end
  
  
