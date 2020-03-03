%        Voltvar
%  ������� ��������� ��������� �� ������ ������� � ������������ ���������;
%  ����� ������������, ���������� � ����������� ������������� ����������� �� ������
%  ������������� �������� � ������� �������� ��������������� ������������
%   x(2n)=c-x(1)-x(2)-...-x(2n-1)>0 (� - ������ ��������)
%  ��. �.147 - 148.

clear all;close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FntNm='Arial Cyr';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vvv=ver('MATLAB');nmver=str2num(vvv.Version);if nmver>6;
warning('off','MATLAB:dispatcher:InexactMatch');end

n=100;n1=n-1;n2=n-2;h=1/n;i=[1:n];x=h*i;

disp(' ');
disp('  ������� ��������� ��������� �� ������ ������� � ������������ ');
disp('  ��������� �� ������ ������������ (�.147 - 148)');disp(' ');
ind=input('     ������� ����� ������: 1 - �����������������, 2 - ��������� �����  ');
disp(' ');

if ind==2;disp(' ��������� �����');
  z0=x.*sign(x-0.5);c=2.1;% ��������� �������; u1 - ������ �����; � - ������ ��������
  VAR=2;
u1=0.5*(1+sign(x-0.5)).*(8*x.*sqrt(x-0.5)/3+2*sqrt(x-0.5)/3)-4*x.^(3/2)/3;
p=2*sqrt(x)';% �������� �� ���� 1./sqrt(x-s)
else
p=x';disp(' ������ �����������������');
z0=0.5*(sign(x-0.3)+sign(x-0.6))+ones(1,n);c=2.1;VAR=2;
u1=0.5*(abs(x-0.3)+abs(x-0.6))+x-0.45;
end

p1=[0 p(1:n1)']';t=tril(ones(n-1,n-1));
b0=tril(toeplitz(p(1:n1)));
b1=[p [zeros(1,2*n1);b0 -b0] zeros(n,1)];
b=[b1;ones(1,2*n)];
%
del=0.01;
%u=[u1+del*(2*rand(size(u1))-1) c]';% ����������� u1
ru=randn(size(u1));nru=norm(ru);u=[u1+del*norm(u1)*ru/nru c]';% ����������� u1
figure(1);plot(x,u1,'r',x,u(1:end-1),'.-');
set(gca,'FontName',FntNm);
title(' ������ � ������������ ������ ����� ���������')
pause(1)
tic;z1=lsqnonneg(b,u);toc;%  nnls
nev=norm(b*z1-u,2)/norm(u,2);
zz=z1(1);v=z1(2:n);w=z1(n+1:2*n-1);
ww=c-sum(z1(1:2*n-1));
z=zz*ones(1,n)+[0 (t*(v-w))'];
error=norm(z-z0,2)/norm(z0,2);
var=z(1)+sum(abs(diff(z)));
disp(' ');disp('     ������ � ����������.');disp(' ');
disp([' �������� ������� ������� = ' num2str(VAR)]);
disp([' ��������� ������ �������� = ' num2str(c)]);
disp([' ������������� ������ ������ = ' num2str(del)]);
disp([' ������� ������������� ������� = ' num2str(nev)]);
disp([' ������������� ������ ������� (� L_2)= ' num2str(error)]);
disp([' �������� ������������� ������� = ' num2str(var)]);
disp(' ');
figure(2);hold on;hhh=plot(x,z0,'r');plot(x,z,'.');hold off;
set(gca,'FontName',FntNm);
title(' ������ � ������������ ������� ��������� ���������')
set(hhh,'LineWidth',2);set(gca,'Box','on');
legend(' ������ �������',' ������������ �������',2);