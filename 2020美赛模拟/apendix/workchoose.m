function workchoose(IN)
work=[1.0500   -1.1670    1.0000    0.9110
      0.6280   -0.7430    1.0890    1.0000
      1.2170   -1.0610    1.1780    0.7330
      1.0000   -1.0610    0.9110    1.0890
      1.2500   -1.0610    0.7330    0.8220
      1.0500   -1.0610    0.8220    1.2670
      0.7830   -0.8490    1.2670    1.1780];
  %����ѡȡʱÿ��Ӱ�����ضԶ�Ӧ������ռ�����֣�
  %�д��������ͣ��д���Ӱ������
  %���ͷֱ�Ϊ������������Ա���ҽ̣������������Ա�����س������̹�����ʱ�������������ҵ
  %Ӱ�����طֱ�Ϊ�����ʣ�����ʱ���������������
  if IN(1,1)==1
      work(1,:)=zeros(1,4); work(4,:)=zeros(1,4);
      work(5,:)=zeros(1,4); work(6,:)=zeros(1,4);
  end
  if IN(1,1)==-1
      work(2,:)=zeros(1,4); work(3,:)=zeros(1,4);
      work(7,:)=zeros(1,4);
  end
  %ѡ�����Ƿ��ж������⹤����0==����ν��1==ֻ�����ڣ�-1==ֻ������
  if IN(2,1)==0
      work(5,:)=zeros(1,4); work(6,:)=zeros(1,4);
  end
  %�ж��Ƿ�������������0==����
   if IN(3,1)==0
      work(7,:)=zeros(1,4);
   end
   %�ж��Ƿ���������ؼ��ܣ�0==û��
  IN(1,:)=[]; IN(1,:)=[]; IN(1,:)=[];
  %ȥ��������жϲ��֣���ͶȨ�ز��ֽ��м���
  OUT=work*IN;
  disp(OUT);
  %��������÷����
  NAME={'salesman','waiter','private teacher','delivery man','worker Who do hard manual work','hourly worker','network service provider'};
  [R,Q]=max(OUT); OUT(Q,1)=-200;
  [R,W]=max(OUT); OUT(W,1)=-200;
  [R,E]=max(OUT);
  Result={'first choice',NAME{1,Q};'second choice',NAME{1,W};'third choice',NAME{1,E}};
  disp(Result);
  %���Ҳ�����÷�������������
  OUT=cell2table(Result);
  writetable(OUT,'output.txt');
  type output.txt;
  %��������������ı��ĵ���
end
  
  
