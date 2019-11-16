t=0:0.1:38;
H=((1*(t.^2))/2).*(t>=0&t<10)+((10*t)-50).*(t>=10&t<28)+(-(1*t.*(t - 76))/2-442).*(t>=28&t<=38);
P=12*H;
figure('NumberTitle','off','Name','轿厢外气压变化曲线');

%坐标轴加箭头
figure1=figure;
annotation1=annotation(figure1,'arrow',[0.131 0.131],[0.92 0.96]);
annotation2=annotation(figure1,'arrow',[0.88 0.94],[0.1115 0.1115]);

%非控制轿厢气压曲线
plot(t,P,'k','linewidth',2);
xlabel('t(s)');
ylabel('P(pa)');

%取消坐标轴刻度
set(gca,'ytick',[]);
set(gca,'xtick',[]);
box off; %删除坐标轴右侧和上侧边框

%坐标轴长度设定
axis([0 38 0 3500 ]);
grid;
hold on;

%连接首尾
x=[0,38];
y=[0,3360];
plot(x,y,'b','linewidth',2);
hold on;
%绘制阶梯调压曲线
array_t=linspace(0,36,13);
array_t(14)=38;
array_p=linspace(0,3360,14);
for i=2:13
    if mod(i,2)==0
        array_p(i)=array_p(i)+100*unifrnd(-1,1);
    else
        array_p(i)=array_p(i-1);
    end
end

%给定参数进行示意图绘制
%array_t=linspace(0,38,8);
%array_t=[0,6,10,16,23,28,32,38];
%array_p=[0,1000,1100,1700,1800,2500,2600,3360];

plot(array_t,array_p,'r','linewidth',2);
legend('非控制模式','固定变化模式','分段调节模式');
