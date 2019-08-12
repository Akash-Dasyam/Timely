function [cl] = news1(y)
	fileId = fopen('C:\Users\Akash dasyam\Desktop\mlpro\TSeries\app.csv');
	dat = textscan(fileId,'%s %s','Delimiter',',');
	data=csvread('C:\Users\Akash dasyam\Desktop\mlpro\TSeries\apps.csv');
	zx=data(:,2);
	z=length(zx);
	m=length(y);
	X=zeros(m,2);
	for i=1:m,
		X(i,:)=[1 i]; 
	end
	for i=1:m,
		if(y(i)==0),
			y(i)=z;
		endif
	end

	y1=zeros(m,1);
	lambda=[0.01 0.03 0.1 0.3 1.0 3.0 10 30];
	theta=zeros(2,1);
	mintheta=zeros(2,1);
	mat=zeros(2,2);
	mat(2,2)=1;
	min=0;
	J=0;
	cl=0;
	values=zeros(z,1);
	maxvalue=0;
	lamb=0;

	for j=1:z,
		for k=1:length(y),
			if(y(k)==j),
				y1(k)=1;
			else,
				y1(k)=0;
			endif
		end
		
		for i=1:length(lambda),
			theta=inv(X'*X+lambda(i).*mat)*X'*y1;
			J=(1/int32(m*0.4))*(-y1'*log(sigmoid(X*theta))-(1-y1)'*log(1-sigmoid(X*theta)));
			if(min==0),
				min=J;
				mintheta=theta;
				lamb=lambda(i);
			endif
			if(min>J),
				min=J;
				mintheta=theta;
				lamb=lambda(i);
			endif
		end
		
		values(j)=sigmoid([1 (m+1)]*mintheta);
		if(maxvalue==0),
			maxvalue=values(j);
			cl=j;
		endif
		if(maxvalue<values(j))
			maxvalue=values(j);
			cl=j;
		endif
	end
	
	max=0;
	for j=1:z,
		flag=0;
		for k=1:length(y),
			if(j==y(k)),
				flag=1;
			endif
		end
		if(flag!=1),
			values(j)=0;
		endif
	end
		%fprintf("%d--->%f\n",0,values(z));
	%for j=1:z-1,
		%fprintf("%d--->%f\n",j,values(j));
	%end
	if(cl==z),
		cl=0;
	endif
	valsort=sort(values.*-1);
	for j=1:5,
		for k=1:z,
			if(valsort(j)==(-1.*values(k))),
				if (k==z),
					k=0;
				endif
				appl=dat{1,1}{(k+2),1};
				fprintf("Recommendations:%d\t%s\n",k,appl);
			endif
		end
	end
end




