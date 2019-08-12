m1=30;
m2=00;
cl=0;
c=0;
d=0;
times=zeros(48,3);
h=localtime(time()).hour;
m=localtime(time()).min;
mact=m;
%runit.txt here if anything doesnt work
data=load('C:\Users\Akash dasyam\Desktop\mlpro\m2saver.csv');
for i=1:48,
	times(i,1)=c;
	if(mod(i,2)!=0),
		times(i,2)=0;
	else,
		times(i,2)=30;
		c++;
	endif
	times(i,3)=i;
end
%times
if(m>30),
	m=30;
else,
	m=0;
endif

for i=1:48,
	if(h==times(i,1) && m==times(i,2)),
		k=times(i,3);
	endif
end

for j=1:(length(data)/48),
		y(j,1)=data((48*(j-1)+k),2);
		x(j,1)=data((48*(j-1)+k),1);
end	
%k
fprintf("Recommending @ %d:%d : \n",h,mact);
[cl]=news1(y);