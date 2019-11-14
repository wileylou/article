t=0:0.1:38;
H=((1*(t.^2))/2).*(t>=0&t<10)+((10*t)-50).*(t>=10&t<28)+(-(1*t.*(t - 76))/2-442).*(t>=28&t<=38);
P=12*H;
figure('NumberTitle','off','Name','��������ѹ�仯����');
plot(t,P,'k','linewidth',2);
xlabel('t(s)');
ylabel('P(pa)');
axis([0 38 0 3500 ]);
grid;
hold on;
%������β
x=[0,38];
y=[0,3360];
plot(x,y,'b','linewidth',2);
hold on;
%���ƽ��ݵ�ѹ����
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
plot(array_t,array_p,'r','linewidth',2);
legend('�ǿ���ģʽ','�̶��仯ģʽ','�ֶε���ģʽ');